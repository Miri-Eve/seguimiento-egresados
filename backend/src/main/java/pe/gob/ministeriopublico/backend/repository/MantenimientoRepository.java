package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.Mantenimiento;

/** Acceso CRUD a los mantenimientos. */
@Repository
public interface MantenimientoRepository extends JpaRepository<Mantenimiento, Integer> { }
