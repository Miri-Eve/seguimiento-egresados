package pe.gob.ministeriopublico.backend.controller;

import java.util.List;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import pe.gob.ministeriopublico.backend.Service.CrudService;

/** Expone los endpoints CRUD comunes para todos los controladores. */
public abstract class CrudController<T, ID> {
    private final CrudService<T, ID> service;

    protected CrudController(CrudService<T, ID> service) {
        this.service = service;
    }

    /** Lista todos los registros. */
    @GetMapping
    public List<T> listar() {
        return service.listar();
    }

    /** Obtiene un registro por su identificador. */
    @GetMapping("/{id}")
    public ResponseEntity<T> buscarPorId(@PathVariable ID id) {
        T entity = service.buscarPorId(id);
        return entity == null ? ResponseEntity.notFound().build() : ResponseEntity.ok(entity);
    }

    /** Crea un registro o guarda los cambios enviados desde JSON. */
    @PostMapping
    public ResponseEntity<T> guardar(@RequestBody T entity) {
        T saved = service.guardar(entity);
        return ResponseEntity.status(HttpStatus.CREATED).body(saved);
    }

    /** Actualiza un registro existente usando el identificador de la ruta. */
    @PutMapping("/{id}")
    public ResponseEntity<T> actualizar(@PathVariable ID id, @RequestBody T entity) {
        if (service.buscarPorId(id) == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(service.guardar(entity));
    }

    /** Elimina un registro por su identificador. */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(@PathVariable ID id) {
        if (service.buscarPorId(id) == null) {
            return ResponseEntity.notFound().build();
        }
        service.eliminar(id);
        return ResponseEntity.noContent().build();
    }
}
