package pe.gob.ministeriopublico.backend.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/** Representa un despacho ubicado dentro de una sede. */
@Entity
@Table(name = "despacho")
public class Despacho {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_despacho") private Integer idDespacho;
    @Column(name = "id_sede", nullable = false) private Integer idSede;
    @Column(name = "nombre_despacho", nullable = false) private String nombreDespacho;
    @Column(name = "tipo_proceso") private String tipoProceso;

    public Despacho() { }
    public Integer getIdDespacho() { return idDespacho; }
    public void setIdDespacho(Integer idDespacho) { this.idDespacho = idDespacho; }
    public Integer getIdSede() { return idSede; }
    public void setIdSede(Integer idSede) { this.idSede = idSede; }
    public String getNombreDespacho() { return nombreDespacho; }
    public void setNombreDespacho(String nombreDespacho) { this.nombreDespacho = nombreDespacho; }
    public String getTipoProceso() { return tipoProceso; }
    public void setTipoProceso(String tipoProceso) { this.tipoProceso = tipoProceso; }
}
