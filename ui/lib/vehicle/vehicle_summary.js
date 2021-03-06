
$(document).ready(function () {
    
    // modal loading part....

    var _url = $("#_url").val();
    
    var renew_path="";
    
    $.fn.modal.defaults.width = '850px';
    
    
    var $modal = $('#ajax-modal');

    $('[data-toggle="tooltip"]').tooltip();


    $('.vehicle_expense').on('click', function (e) {
        
        var amount= this.id;
        var vehicle_num=$('#vehicle_number').val();
        e.preventDefault();

        $('body').modalmanager('loading');
        $modal.load(_url + 'vehicle/modal_vehicle_expense/' + vehicle_num +'/'+amount, '', function () {

            $modal.modal();

        });
    });
    

    $('.roadtax_expense').on('click', function (e) {
        
        var id = this.id;
        
        e.preventDefault();

        $('body').modalmanager('loading');

        $modal.load(_url + 'vehicle/modal_roadtax_expense/'+id, '', function () {

            $modal.modal();

        });
    });

    $('.insurance_expense').on('click', function (e) {

        var id = this.id;

        e.preventDefault();

        $('body').modalmanager('loading');

        $modal.load(_url + 'vehicle/modal_insurance_expense/' + id, '', function () {

            $modal.modal();

        });
    });

    $('.loan_expense').on('click', function (e) {

        var amount = this.id;
        var id=$('#loan_id').val();

        e.preventDefault();

        $('body').modalmanager('loading');

        $modal.load(_url + 'vehicle/modal_loan_expense/' + id + '/'+amount, '', function () {

            $modal.modal();

        });
    });

    $('.principal_expense').on('click', function (e) {

        var id = $('#loan_id').val();
        var amount = this.id;
        e.preventDefault();

        $('body').modalmanager('loading');

        $modal.load(_url + 'vehicle/modal_loan_expense/' + id + '/' + amount + '/1', '', function () {

            $modal.modal();

        });

    });

    $('.roadtax_renew').on('click', function(e){
        var id=this.id;
        e.preventDefault();
        renew_path=_url+'vehicle/post_roadtax';

        $('body').modalmanager('loading');

        $modal.load(_url + 'vehicle/modal_add_roadtax/'+id+'/clone', '', function () {

            $modal.modal();

        });
        

    });
    
    
    
    $('.insurance_renew').on('click', function (e) {
        var id = this.id;
        e.preventDefault();
        renew_path=_url+'vehicle/post_insurance';

        $('body').modalmanager('loading');

        $modal.load(_url + 'vehicle/modal_add_insurance/' + id + '/clone', '', function () {

            $modal.modal();

        });


    });

    $('.view_transaction_expense').on('click', function (e) {
        var vehicle_num = this.id;
        e.preventDefault();
        view_path = _url + 'transactions/vehicle_transactions_list' + '/' + vehicle_num + '/expense';
        window.location.href=view_path;
    });


    $('.view_transaction_income').on('click', function (e) {
        var vehicle_num = this.id;
        e.preventDefault();
        view_path = _url + 'transactions/vehicle_transactions_list'+'/'+vehicle_num+'/income';
        window.location.href=view_path;

    });

    $(".cdelete").click(function (e) {

        e.preventDefault();
        id = this.id;
        var sure_msg = $('#sure_msg').val();

        bootbox.confirm(sure_msg, function (result) {

            if (result) {

                var _url = $("#_url").val();

                window.location.href = _url + "vehicle/del_roadtax/" + id;
            }
        });
    });


    $modal.on('click', '.modal_submit', function (e) {

        $('#roadtax_total').prop('disabled', false);
        $('#insurance_total').prop('disabled', false);
        
        e.preventDefault();

        $modal.modal('loading');

        $.post(renew_path, $("#rform").serialize())
            .done(function (data) {

                if ($.isNumeric(data)) {

                    location.reload();
                   
                }

                else {
                    $modal.modal('loading');
                    toastr.error(data);
                }

            });

    });


    $modal.on('click', '.expense_submit', function (e) {

        e.preventDefault();

        $modal.modal('loading');

        $.post(_url + "transactions/expense-post/", $("#eform").serialize())
            .done(function (data) {

                if ($.isNumeric(data)) {

                    location.reload();

                }

                else {
                    $modal.modal('loading');
                    toastr.error(data);
                }

            });

    });
    $.fn.dataTable.ext.classes.sPageButton = 'button button-primary';
    $.fn.DataTable.ext.pager.numbers_length = 5;

    $('#ib_dt_floor').DataTable({
        "processing": true,
        "paging": true,
        "pageLength": 3,
        "bFilter": false,
        "bInfo": false,
        "bLengthChange": false,
        "order": [[0, "asc"]],
        "pagingType": "simple_numbers",
        "responsive": true,
        // "serverSide": true,
    });

    $('#ib_dt_hp').DataTable({
        "processing": true,
        "paging": true,
        "pageLength": 5,
        "bFilter": false,
        "bInfo": false,
        "bLengthChange": false,
        "order": [
            [0, "asc"]
        ],
        "pagingType": "simple_numbers",
        "responsive": true,
        // "serverSide": true,
    });
});