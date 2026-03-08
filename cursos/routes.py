import forms
from models import db, Cursos, Maestros, Alumnos, Inscripcion
from . import cursos
from flask import app, render_template, request, redirect, url_for

@cursos.route("/cursos", methods=["GET", "POST"])
def listado():
    create_form = forms.CursoForm(request.form)
    curso = Cursos.query.all()
    maestros = Maestros.query.all()
    return render_template("cursos/listadoCur.html", form = create_form, curso=curso, maestros = maestros)

@cursos.route("/cursos/insertar", methods=["GET", "POST"])
def insertar():
    create_form = forms.CursoForm()
    maestros = Maestros.query.all()
    create_form.maestro_id.choices = [
        (m.matricula, m.nombre) for m in maestros
    ]
    if create_form.validate_on_submit():
        curso=Cursos(nombre=create_form.nombre.data,
                     descripcion=create_form.descripcion.data,
                     maestro_id=create_form.maestro_id.data,
                      )
        db.session.add(curso)
        db.session.commit()
        return redirect(url_for("cursos.listado"))
    return render_template("cursos/insertar.html", form=create_form, maestros=maestros)

@cursos.route("/cursos/detalles", methods=["GET", "POST"])
def detalles():
    if request.method == "GET":
        id = request.args.get('id')
        curso = db.session.query(Cursos).filter(Cursos.id == id).first()
        nombre = curso.nombre
        alumnos = db.session.query(Alumnos)\
            .join(Inscripcion, Alumnos.id == Inscripcion.alumno_id)\
            .filter(Inscripcion.curso_id == id)\
            .all()
        maestro = db.session.query(Maestros)\
            .filter(Maestros.matricula == curso.maestro_id)\
            .first()
    return render_template("cursos/detalles.html", id=id, nombre=nombre, maestro=maestro, alumnos = alumnos)

@cursos.route("/cursos/asignar", methods=["GET", "POST"])
def asignar():
    id = request.args.get('id') or request.form.get('curso_id')
    curso = Cursos.query.get(id)
    form = forms.AsignarAlumnoForm()
    
    form.alumno_id.choices = [
        (a.id, f"{a.nombre} {a.apellidos}")
        for a in Alumnos.query.all()
    ]

    if form.validate_on_submit():
        alumno_id = form.alumno_id.data
        alumno = Alumnos.query.get(alumno_id)
        if alumno not in curso.alumnos:
            curso.alumnos.append(alumno)
            db.session.commit()

        return redirect(url_for("cursos.asignar", id=id))

    alumnos = curso.alumnos  # gracias a la relación
    return render_template("cursos/asignar.html", form=form, id=id, alumnos=alumnos)

@cursos.route("/cursos/modificar", methods=["GET", "POST"])
def modificar():
    create_form = forms.CursoForm(request.form)
    maestros = Maestros.query.all()
    create_form.maestro_id.choices = [
        (m.matricula, m.nombre) for m in maestros
    ]
    if request.method == "GET":
        id = request.args.get('id')
        curso = Cursos.query.get(id)
        create_form.id.data = curso.id
        create_form.nombre.data = curso.nombre
        create_form.descripcion.data = curso.descripcion
        create_form.maestro_id.data = curso.maestro_id
    if request.method == "POST":
        id = create_form.id.data
        curso = db.session.query(Cursos).filter(Cursos.id == id).first()
        curso.nombre = create_form.nombre.data
        curso.descripcion = create_form.descripcion.data
        curso.maestro_id = create_form.maestro_id.data
        db.session.add(curso)
        db.session.commit()
        return redirect(url_for("cursos.listado"))
    return render_template("cursos/modificar.html", form=create_form, id=id, maestros=maestros)

@cursos.route("/cursos/eliminar", methods=["GET", "POST"])
def eliminar():
    create_form = forms.CursoForm(request.form)
    maestros = Maestros.query.all()
    create_form.maestro_id.choices = [
        (m.matricula, m.nombre) for m in maestros
    ]
    if request.method == "GET":
        id = request.args.get('id')
        curso = Cursos.query.get(id)
        create_form.id.data = curso.id
        create_form.nombre.data = curso.nombre
        create_form.descripcion.data = curso.descripcion
        create_form.maestro_id.data = curso.maestro_id
    if request.method == "POST":
        id = request.form.get("id")
        curso = Cursos.query.get(id)
        Inscripcion.query.filter_by(curso_id=id).delete()
        db.session.delete(curso)
        db.session.commit()
        return redirect(url_for("cursos.listado"))
    return render_template("cursos/eliminar.html", form=create_form, id=id, maestros=maestros)
