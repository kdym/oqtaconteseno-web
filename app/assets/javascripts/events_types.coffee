$('#events-types-list').DataTable
  order: [[1, 'asc']]
  columnDefs: [{
    orderable: false
    targets: [0, 2]
  }]

$('#tipo').ddslick
  width: '100%'
  background: '#fff'
  onSelected: (data) ->
    $('#event_tipo').val data.selectedIndex