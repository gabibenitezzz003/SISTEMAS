from sqlalchemy import create_engine, Column, Integer, String, Date, DateTime, Boolean, ForeignKey, Text, Float
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship
from database import db

Base = declarative_base()

class Employee(Base):
    __tablename__ = 'employees'
    
    id = Column(Integer, primary_key=True)
    name = Column(String(100))
    skill = Column(String)  # COM o CROSS
    active = Column(Boolean, default=True)
    shifts = relationship("Shift", back_populates="employee")
    weekend_schedules = relationship("WeekendSchedule", back_populates="employee")

class Shift(Base):
    __tablename__ = 'shifts'
    
    id = Column(Integer, primary_key=True)
    employee_id = Column(Integer, ForeignKey('employees.id'))
    date = Column(Date)
    shift_type = Column(String)  # Mañana, Tarde, Noche
    is_weekend = Column(Boolean)
    employee = relationship("Employee", back_populates="shifts")

class WeekendSchedule(Base):
    __tablename__ = 'weekend_schedules'
    
    id = Column(Integer, primary_key=True)
    date = Column(Date)
    employee_id = Column(Integer, ForeignKey('employees.id'))
    shift_type = Column(String)
    employee = relationship("Employee", back_populates="weekend_schedules")

class Asesor(Base):
    __tablename__ = 'asesores'
    
    id = Column(Integer, primary_key=True)
    nombre = Column(String(100))
    dni = Column(String(20))
    skill = Column(String(50))
    activo = Column(Boolean, default=True)

class DiaNoHabil(Base):
    __tablename__ = 'dias_no_habiles'
    
    id = Column(Integer, primary_key=True)
    asesor_id = Column(Integer, ForeignKey('asesores.id'))
    fecha = Column(Date)
    tipo = Column(String(50))
    horario = Column(String(50))

class CodigoHorario(Base):
    __tablename__ = 'codigos_horario'
    
    id = Column(Integer, primary_key=True)
    codigo = Column(String(20))
    descripcion = Column(String(100))

class Feriado(Base):
    __tablename__ = 'feriados'
    
    id = Column(Integer, primary_key=True)
    fecha = Column(Date)
    descripcion = Column(String(100)) 

class AIQuery(db.Model):
    __tablename__ = 'ai_queries'
    
    id = db.Column(db.Integer, primary_key=True)
    query = db.Column(db.String(500))
    response = db.Column(db.Text)
    timestamp = db.Column(db.DateTime)

class CompanyMetrics(Base):
    __tablename__ = 'company_metrics'
    id = Column(Integer, primary_key=True)
    company_name = Column(String(50))
    market_share = Column(Float)
    customer_satisfaction = Column(Float)
    coverage_score = Column(Float)
    timestamp = Column(DateTime)

class MarketData(Base):
    __tablename__ = 'market_data'
    id = Column(Integer, primary_key=True)
    company_name = Column(String(50))
    plan_name = Column(String(100))
    price = Column(Float)
    data_gb = Column(Integer)
    minutes = Column(Integer)
    timestamp = Column(DateTime)

class SalesData(Base):
    __tablename__ = 'sales_data'
    id = Column(Integer, primary_key=True)
    company_name = Column(String(50))
    region = Column(String(50))
    sales_amount = Column(Float)
    units_sold = Column(Integer)
    timestamp = Column(DateTime) 