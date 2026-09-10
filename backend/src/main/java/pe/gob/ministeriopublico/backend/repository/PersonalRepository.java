package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.Personal;

/** Acceso CRUD al personal. */
@Repository
public interface PersonalRepository extends JpaRepository<Personal, Integer> { }
