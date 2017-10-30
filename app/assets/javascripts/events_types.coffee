$('#events-types-list').DataTable
  order: [[1, 'asc']]
  columnDefs: [{
    orderable: false
    targets: [0, 2]
  }]

$('#events-type-id').ddslick
  width: '100%'
  background: '#fff'
  onSelected: (data) ->
    $('#event_events_type_id').val data.selectedData.value