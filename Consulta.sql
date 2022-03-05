

SELECT f.RFC
		,f.RazonSocial
		,c1.Nombre as MetodoPago
		,a1.Clave as UsoCFDI_Clave
		,a1.Descripcion as UsoCFDI_Descripcion
		,c2.Nombre as TipoPersona
		,a2.Clave as RegimenFiscal_Clave
		,a2.Descripcion as RegimenFiscal_Descripcion
		,case when f.EsSucursal = '1' then 'Si' else 'No' end as EsSucursal
		,co2.Correo 
		,c3.Código as EntidadTributariaCodigo
		,c3.Nombre as EntidadTributaria

	FROM DatosFacturacion f
	join Clasificacion c1 on f.MetodoPago = c1.Código and c1.Grupo = 1
	join Clasificacion c2 on f.TipoPersona = c2.idClasificacion and c2.Grupo = 31
	join ArtefactoCFDI a1 on f.UsoCFDI = a1.idArtefacto 
	join ArtefactoCFDI a2 on f.RegimenFiscal = a2.idArtefacto 
	join ReDatosFacturacion_Correos co1 on f.idDatosFacturacion = co1.idDatosFacturacion
	join Correo co2 on co1.idCorreo = co2.idCorreo
	join ReEntidadTributaria_DatosFacturacion e1 on f.idDatosFacturacion = e1.idDatosFacturacion
	join EntidadTributaria e2 on e1.idEntidadTributaria = e2.idEntidadTributaria
	join Clasificacion c3 on e2.idClasificacion = c3.idClasificacion


select distinct RFC from (SELECT f.RFC,f.RazonSocial,c1.Nombre as MetodoPago,a1.Clave as UsoCFDI_Clave,a1.Descripcion as UsoCFDI_Descripcion,c2.Nombre as TipoPersona,a2.Clave as RegimenFiscal_Clave,a2.Descripcion as RegimenFiscal_Descripcion,case when f.EsSucursal = '1' then 'Si' else 'No' end as EsSucursal,co2.Correo,c3.Código,c3.Nombre FROM DatosFacturacion f join Clasificacion c1 on f.MetodoPago = c1.Código and c1.Grupo = 1 join Clasificacion c2 on f.TipoPersona = c2.idClasificacion and c2.Grupo = 31 join ArtefactoCFDI a1 on f.UsoCFDI = a1.idArtefacto join ArtefactoCFDI a2 on f.RegimenFiscal = a2.idArtefacto join ReDatosFacturacion_Correos co1 on f.idDatosFacturacion = co1.idDatosFacturacion join Correo co2 on co1.idCorreo = co2.idCorreo join ReEntidadTributaria_DatosFacturacion e1 on f.idDatosFacturacion = e1.idDatosFacturacion join EntidadTributaria e2 on e1.idEntidadTributaria = e2.idEntidadTributaria join Clasificacion c3 on e2.idClasificacion = c3.idClasificacion )T
  
  
  
  