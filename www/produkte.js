function showProducts() {
    $.ajax({
        method: 'POST', 
        url: '/freitag/lib/get_produkte.php', 
        success: function(res) {
            erg = JSON.parse(res);
            table = $('<table class="table table-striped table-hover">');
            tbody = $('<tbody>');
            tr = $('<tr>');
            $(tr).append($('<th scope="col">').text('Nummer'));
            $(tr).append($('<th scope="col">').text('Name'));
            $(tr).append($('<th scope="col">').text('Prozessor'));
            $(tr).append($('<th scope="col">').text('RAM'));  
            $(tr).append($('<th scope="col">').text('Speicher')); 
            $(tr).append($('<th scope="col">').text('Preis')); 
            $(tr).append($('<th scope="col">').text('Info')); 
            $(tr).append($('<th scope="col">').append($('<a onclick="openAddPC()">').append($('<i class="bi bi-plus">'))));
            $(tbody).append(tr);
            $.each(erg, function(indx, el) {
                tr = $('<tr>');
                $.each(el, function(ind, el2) {
                    switch (ind) {
                        case 'ram':
                        case 'speicher': 
                            $(tr).append($('<td>').append(el2 + 'GB'));
                            break;
                        case 'preis':
                            $(tr).append($('<td>').append(el2 + '€'));
                            break;
                        case 'bild': 
                        case 'beschreibung':
                            break;
                        default: 
                            $(tr).append($('<td>').append(el2));
                            break;
                       
                    }
                });
                td = $('<td>');
                
                $(td).append($('<a onclick="showDetail('+el.id_model+')"">').append($('<i class="bi bi-info-circle">')));
                $(td).append($('<a onclick="deleteProdukt('+el.id_model+')">').append($('<i class="bi bi-trash">')));
                $(td).append($('<a onclick="openEditPC('+el.id_model+')">').append($('<i class="bi bi-pencil">')));
                $(tr).append(td);
                $(tbody).append(tr)
            });
            $(table).append(tbody);
            $('#products').html(table);
        }
    });
}

function goHome() {
    $('#detail').hide();
    $('#products').show();
}

function showDetail(id) {
    $('#products').hide();
    $('#detail').show();
    
    $.ajax({
        method: 'POST', 
        url: "/freitag/lib/get_produkt.php", 
        data: 'id_model=' + id,
        success: function(res) {   
            erg = JSON.parse(res);
            table = $('<table >');
            tbody = $('<tbody>');
            $.each(erg, function(indx, el) {
                tr = $('<tr onclick="showDetail('+el.id_model+')">');
                var img = $('<img />',
                { id: 'Myid',
                src: '/freitag/www/img/'+el.bild+'', 
                });
              $('#name').html(el.name);
              $('#imgcontainer').html(img);
              $('#desc').html(el.beschreibung);
              $('#preis').html($('<p class="fw-bold"> Preis:  ' +el.preis + '€ </p>'));
              $('#add').html($('<a onclick="addToCart('+el.id_model+')">').append('Jetzt kaufen! ').append($('<i class="bi bi-cart">')));
            });
           // $('#detail').html(table);
        }
    });
}

function addToCart(id) {
    $.ajax({
        method: 'POST', 
        url: "/freitag/lib/get_produkt.php", 
        data: 'id_model=' + id,
        success: function(res) {   
            erg = JSON.parse(res);
            $.each(erg, function(indx, el) {
                tr = $('<tr>');
                tr.append($('<td>').append(el.name));
                tr.append($('<td>').append(el.preis + '€'));
                $('#cartbody').append(tr);

                $('#sum').html( (+parseInt($('#sum').html()) + +el.preis) + '€' );
            });
           // $('#detail').html(table);
        }
    });

}

function showCart() {
    $('#cartModal').modal('show');
}

function deleteProdukt(id) {
    $('#alertModal').modal('show');
    $('#alertTitle').html('Projekt löschen');
    $('#modal-body-alert-text').html('Wollen sie das Projekt wirklich löschen?');
    $('#modal-confirm').attr('onclick', 'deleteProdukt2('+id+')');
}
function deleteProdukt2(id) {
    $.ajax({
        method: 'POST', 
        url: "/freitag/lib/delete_produkt.php", 
        data: 'id_produkt=' + id,
        success: function(res) {
            console.log(res);
            erg = JSON.parse(res);
                showProducts();
            if(erg.erg == 'OK') {
                showProducts();
            } else {
                $('#modal-body-text').html(erg.detail);
                $('#Modal').modal('show');
            }
        }
    });
}

function openAddPC() {
    $('#produktname').val('');
    $('#preis').val('');
    $('#prozessor').val('');
    $('#ram').val('');
    $('#speicher').val('');

    $('#ModalLabel').html('Neues Produkt');
    $('#produktConfirm').html('Hinzufügen');
    $('#produktConfirm').attr('onclick', 'addPC()');
    $('#modelModal').modal('show');
}

function addPC() {
    produktname = $('#produktname').val();
    preis = $('#preis').val();
    prozessor = $('#prozessor').val(); 
    ram = $('#ram').val();
    speicher = $('#speicher').val(); 

    $.ajax({
        method: 'POST', 
        url: "/freitag/lib/add_produkt.php", 
        data: "produktname=" + produktname + "&preis=" + preis + "&prozessor=" + prozessor + "&ram=" + ram + "&speicher=" + speicher,
        success: function(res) {
            console.log(res);
            showProducts();
        } 
    });
}

function openEditPC(id) {
    $.ajax({
        method: 'POST', 
        url: "/freitag/lib/get_produkt.php", 
        data: 'id_model=' + id,
        success: function(res) {   
            erg = JSON.parse(res);
            $.each(erg, function(indx, el) {
                $('#produktname').val(el.name);
                $('#preis').val(el.preis);
                $('#prozessor').val(el.prozessor);
                $('#ram').val(el.ram);
                $('#speicher').val(el.speicher);
            });
            $('#ModalLabel').html('Produkt ändern');
            $('#produktConfirm').html('Änderungen speichern');
            $('#produktConfirm').attr('onclick', 'editPC('+id+')');
            $('#modelModal').modal('show');
        }
    });
}

function editPC(id) {
    produktname = $('#produktname').val();
    preis = $('#preis').val();
    prozessor = $('#prozessor').val(); 
    ram = $('#ram').val();
    speicher = $('#speicher').val(); 

    $.ajax({
        method: 'POST', 
        url: "/freitag/lib/edit_produkt.php", 
        data: "id_model=" + id + "&produktname=" + produktname + "&preis=" + preis + "&prozessor=" + prozessor + "&ram=" + ram + "&speicher=" + speicher,
        success: function(res) {
            console.log(res);
            showProducts();
        } 
    });
}
