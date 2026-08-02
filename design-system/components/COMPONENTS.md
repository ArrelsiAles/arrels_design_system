# Componentes

Esta es la primera taxonomía completa del sistema. Define contratos; no prescribe React, Flutter ni HTML.

## Contrato común

Cada componente implementado debe documentar: propósito, anatomía/slots, variantes, tamaños, estados, comportamiento responsive, reglas de contenido, accesibilidad, tokens consumidos y adaptaciones de plataforma.

Estados mínimos cuando apliquen: default, hover, focus-visible, pressed, selected, loading, disabled, read-only, error y success.

## Acciones

- **Button:** primary, secondary, ghost, destructive; small 36, medium 44, large 48; iconos opcionales; loading conserva el ancho.
- **IconButton:** neutral o tonal; exige label accesible; icono 20–24 dentro de target 44–48.
- **Link:** inline o standalone; subrayado en contenido largo y focus visible.
- **SplitButton:** solo desktop y para una acción principal con alternativas estrechamente relacionadas.

## Formularios

- **Input, SearchField, TextArea:** label, control, helper/error, contador opcional.
- **Select y Combobox:** select para listas breves; combobox para búsqueda y listas largas.
- **Checkbox y Radio:** control, label y ayuda; checked en `action.primary` con marca blanca.
- **Switch:** cambios inmediatos y reversibles; nunca para enviar un formulario.
- **DatePicker y TimePicker:** locale CA/ES, entrada manual accesible y validación explícita.
- **FileUpload:** tipo/tamaño permitido, progreso, error y eliminación reversible.

## Estado y feedback

- **Badge:** neutral, info, success, warning, danger; texto obligatorio si el estado importa.
- **Alert:** inline o page; título, mensaje, acción y dismiss opcional.
- **Toast:** confirmación no crítica; 3–5 s, pausa accesible y `aria-live` polite.
- **Progress:** determinado o indeterminado; siempre con texto cuando representa una tarea.
- **Skeleton:** preserva layout; no para esperas muy cortas.
- **EmptyState:** explica por qué está vacío y propone una única acción cuando procede.
- **OfflineState:** indica última sincronización, acciones disponibles y cola pendiente.

## Contenido

- **Avatar:** imagen, iniciales o icono; nunca única identificación de una persona.
- **Card:** estática, interactiva o seleccionable; una card completa no contiene múltiples targets anidados ambiguos.
- **ListItem:** leading, title, description, metadata, trailing y estado.
- **MetricCard:** etiqueta, valor, unidad, tendencia y periodo; no inventar comparativas ausentes.
- **Accordion:** para información secundaria, conserva heading semántico.
- **Timeline:** hora/fecha, título, descripción, actor y estado.

## Navegación

- **Sidebar:** desktop ≥1024; icono + label; jerarquía primaria estable.
- **TopBar:** título/contexto, búsqueda y acciones globales.
- **BottomNavigation:** mobile, máximo cinco destinos de primer nivel, icono + label.
- **Tabs:** vistas hermanas del mismo contexto; no sustituyen navegación profunda.
- **Breadcrumb:** web para tres o más niveles.
- **Pagination:** páginas para datasets estables; carga incremental para feeds.

## Datos

- **Table:** header, sorting, selección, estados, toolbar y paginación; alternativa mobile en lista/card.
- **FilterBar:** filtros activos visibles, contador y acción para limpiar.
- **Toolbar:** acciones ligadas al contenido actual; una sola acción primaria.
- **Calendar/Schedule:** día, semana y agenda; estado no indicado solo por color.
- **ChartContainer:** título, periodo, leyenda, insight textual, estado vacío/error y tabla alternativa.

## Overlays

- **Dialog:** decisión bloqueante o confirmación crítica; foco atrapado y retorno al trigger.
- **Sheet/Drawer:** detalle contextual o edición mobile; salida clara y confirmación si hay cambios.
- **Menu:** acciones breves; no formularios complejos.
- **Popover:** información o controles ligeros; cierre por Escape y click exterior.
- **Tooltip:** explicación auxiliar; nunca contiene información imprescindible.

## Componentes de dominio

- **VisitCard:** persona/identificador permitido, servicio, franja, zona, profesional y estado.
- **RouteStop:** orden, franja, traslado, margen, estado y acción de reordenar accesible.
- **IncidentCard:** severidad, momento, servicio, responsable, evidencia y estado de resolución.
- **SharedPlanMessage:** mensaje de chat con plan estructurado, versión, emisor, resumen y acciones revisar/aceptar.
- **ChatComposer:** texto, adjuntos autorizados, envío de plan y estado offline.
- **EvidenceCard:** tipo, origen, fecha, validación y acceso sujeto a permisos.
- **SyncQueue:** pendientes, fallidos, última sincronización y retry.
- **FamilyAccessRow:** persona invitada, relación, permisos, estado y auditoría.
- **ClockAction:** iniciar/finalizar, ventana horaria, ubicación puntual y confirmación inequívoca.

## Composición

- Un componente no introduce hex, espaciado o radio literal si existe un token semántico.
- Una pantalla no crea una variante local sin justificarla y devolverla al sistema.
- Las adaptaciones nativas pueden cambiar la forma del control, nunca su intención ni sus estados.

