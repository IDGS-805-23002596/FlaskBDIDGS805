import forms 
from models import db, Alumnos, Cursos, Inscripcion
from . import alumnos
from flask import app, render_template, request, redirect, url_for

@alumnos.route("/alumnos", methods=["GET", "POST"])
def listado():
    create_form = forms.UserForm2(request.form)
    alumno = Alumnos.query.all()
    return render_template("alumnos/listadoAlumn.html", form = create_form, alumno=alumno)

@alumnos.route("/alumnos/insertar", methods=["GET", "POST"])
def insertar():
    create_form = forms.UserForm2(request.form)
    if request.method == "POST":
        alumno=Alumnos(nombre=create_form.nombre.data,
                      apellidos=create_form.apellidos.data,                      
                      email=create_form.email.data,
                      telefono=create_form.email.data
                      )
        db.session.add(alumno)
        db.session.commit()
        return redirect(url_for("alumnos.listado"))
    return render_template("alumnos/insertar.html", form=create_form)

@alumnos.route("/alumnos/detalles", methods=["GET", "POST"])
def detalles():
    if request.method == "GET":
        id = request.args.get('id')
        alumn = db.session.query(Alumnos).filter(Alumnos.id == id).first()
        nombre = alumn.nombre
        apellidos = alumn.apellidos
        telefono = alumn.telefono
        email = alumn.email
        cursos = db.session.query(Cursos)\
            .join(Inscripcion, Cursos.id == Inscripcion.curso_id)\
            .filter(Inscripcion.alumno_id == id)\
            .all()
    return render_template("alumnos/detalles.html", id=id, nombre=nombre, apellidos=apellidos,email=email, telefono=telefono, cursos=cursos)

@alumnos.route("/alumnos/modificar", methods=["GET", "POST"])
def modificar():
    create_form = forms.UserForm2(request.form)
    if request.method == "GET":
        id = request.args.get('id')
        alumn = db.session.query(Alumnos).filter(Alumnos.id == id).first()
        create_form.id.data = alumn.id 
        create_form.nombre.data = alumn.nombre
        create_form.apellidos.data = alumn.apellidos
        create_form.email.data = alumn.email
        create_form.telefono.data = alumn.telefono
    if request.method == "POST":
        id = create_form.id.data
        master = db.session.query(Alumnos).filter(Alumnos.id == id).first()
        master.nombre = create_form.nombre.data
        master.apellidos = create_form.apellidos.data
        master.email = create_form.email.data        
        master.telefono = create_form.telefono.data        
        db.session.add(master)
        db.session.commit()
        return redirect(url_for("alumnos.listado"))
    return render_template("alumnos/modificar.html", form=create_form, id=id)

@alumnos.route("/alumnos/eliminar", methods=["GET", "POST"])
def eliminar():
    create_form = forms.UserForm2(request.form)
    if request.method == "GET":
        id = request.args.get('id')
        alumn = db.session.query(Alumnos).filter(Alumnos.id == id).first()
        create_form.id.data = alumn.id 
        create_form.nombre.data = alumn.nombre
        create_form.apellidos.data = alumn.apellidos
        create_form.email.data = alumn.email
        create_form.telefono.data = alumn.telefono
    if request.method == "POST":
        id = create_form.id.data
        alumn = db.session.query(Alumnos).filter(Alumnos.id == id).first()
        db.session.delete(alumn)
        db.session.commit()
        return redirect(url_for("alumnos.listado"))
    return render_template("alumnos/eliminar.html", form=create_form, id=id)
