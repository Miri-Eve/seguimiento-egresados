package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.Clasificacion;

/** Acceso CRUD a las clasificaciones. */
@Repository
public interface ClasificacionRepository extends JpaRepository<Clasificacion, Integer> { }
