from sqlalchemy import Column, Integer, String, Date, DateTime, Numeric, ForeignKey
from app.database import Base

class Asesores(Base):
    __tablename__ = 'asesores'
    
    dni = Column(String(10), primary_key=True)
    nombre = Column(String(100))
    lider = Column(String(100))
    skill = Column(String(10))

    def __repr__(self):
        return f'<Asesor {self.nombre}>'

class CodigosHorarios(Base):
    __tablename__ = 'codigos_horarios'
    
    id = Column(Integer, primary_key=True, autoincrement=True)
    codigo = Column(String(50))
    horas_base = Column(Numeric(4, 2))
    color = Column(String(20))

    def __repr__(self):
        return f'<Codigo {self.codigo}>'

class DiasNoHabiles(Base):
    __tablename__ = 'dias_no_habiles'
    
    id_dia = Column(Integer, primary_key=True, autoincrement=True)
    dni = Column(String(10), ForeignKey('asesores.dni'))
    fecha = Column(Date)
    horario = Column(String(20))
    horas_trabajadas = Column(Numeric(4, 1))
    tipo_dia = Column(String(20))
    skill = Column(String(10))
    nombre = Column(String(100))
    lider = Column(String(100))

    def __repr__(self):
        return f'<DiaNoHabil {self.fecha} - {self.nombre}>'

class Feriados(Base):
    __tablename__ = 'feriados'
    
    id = Column(Integer, primary_key=True, autoincrement=True)
    fecha = Column(Date, nullable=False)
    descripcion = Column(String(255))

    def __repr__(self):
        return f'<Feriado {self.fecha}>' 