package pe.gob.ministeriopublico.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import pe.gob.ministeriopublico.backend.entity.DistritoFiscal;

/** Acceso CRUD a los distritos fiscales. */
@Repository
public interface DistritoFiscalRepository extends JpaRepository<DistritoFiscal, Integer> { }
