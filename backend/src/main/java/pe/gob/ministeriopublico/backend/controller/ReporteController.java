package pe.gob.ministeriopublico.backend.controller;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import pe.gob.ministeriopublico.backend.Service.ReporteService;

@RestController
@RequestMapping("/api/reportes")
public class ReporteController {

    @Autowired
    private ReporteService reporteService;

    @GetMapping("/egresados")
    public ResponseEntity<byte[]> descargarReporte() throws JRException {

        JasperPrint jasperPrint = reporteService.generarReporte();

        byte[] pdf = JasperExportManager.exportReportToPdf(jasperPrint);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=reporte_egresados.pdf")
                .contentType(MediaType.APPLICATION_PDF)
                .body(pdf);
    }
}
