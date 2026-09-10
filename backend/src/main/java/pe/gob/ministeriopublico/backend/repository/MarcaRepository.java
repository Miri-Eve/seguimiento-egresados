package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.Marca;

/** Acceso CRUD a las marcas. */
@Repository
public interface MarcaRepository extends JpaRepository<Marca, Integer> { }
