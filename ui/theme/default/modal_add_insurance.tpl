<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <h3>
        
        {if $f_type eq 'edit'} 
            {$_L['Edit Insurance']} 
        {else}
            {$_L['Add Insurance']} 
        {/if}
        
    </h3>
</div>

<div class="modal-body">

    <div class="row">
    
        <div class="col-md-8">
            <div class="ibox float-e-margins">

                <div class="ibox-content" id="ib_modal_form">
                    
                    <form class="form-horizontal" id="rform">
    

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="vehicle_type">{$_L['Vehicle No']}</label>
    
                            <div class="col-md-4">
    
                                <select id="vehicle_num" name="vehicle_num" style="width:307px" class="form-control">
                                    <option value="{$val['vehicle_num']}" selected>{$val['vehicle_num']}</option>
                                    {foreach $vehicles as $vehicle}
                                    <option value="{$vehicle['vehicle_num']}">{$vehicle['vehicle_num']}</option>
                                    {/foreach}
                                </select>
                                
                                                                   
                            </div>
                        </div>  
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="insurance_amount">{$_L['Insurance Amount']}</label>

                            <div class="col-md-8">
                                <input type="text" id="insurance_amount" name="insurance_amount" class="form-control amount" autocomplete="off" data-a-sign="{$config['currency_code']} "
                                    data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}" data-d-group="2" value="{$val['insurance_amount']}">

                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="rebate_amount">{$_L['Rebate Amount']}</label>
                        
                            <div class="col-md-8">
                                <input type="text" id="rebate_amount" name="rebate_amount" class="form-control amount" autocomplete="off" data-a-sign="{$config['currency_code']} "
                                    data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}" data-d-group="2" value="{$val['rebate_amount']}">
                        
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label" for="insurance_total">{$_L['Insurance Total']}</label>
                        
                            <div class="col-md-8">
                                <input type="text" id="insurance_total" name="insurance_total" class="form-control amount" autocomplete="off" data-a-sign="{$config['currency_code']} "
                                    data-a-dec="{$config['dec_point']}" data-a-sep="{$config['thousands_sep']}" data-d-group="2" value="{$val['insurance_total']}">
                        
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="date" class="col-md-4 control-label">{$_L['Insurance Date']}</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="{$val['insurance_date']}" name="insurance_date" id="Insurance_date" datepicker data-date-format="yyyy-mm-dd"
                                    data-auto-close="true">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="date" class="col-md-4 control-label">{$_L['Due Date']}</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" value="{$val['due_date']}" name="due_date" id="due_date" datepicker data-date-format="yyyy-mm-dd"
                                    data-auto-close="true">
                            </div>
                        </div>
    
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="expiry_status">{$_L['Expiry To Date']}</label>
    
                            <div class="col-md-8">
    
                                <select class="form-control" id="expiry_todate" name="expiry_todate">
                                    <option value="{$val['expiry_todate']}" selected>{$val['expiry_todate']}</option>
                                    <option value="7">7</option>
                                    <option value="14">14</option>
                                    <option value="21">21</option>
                                    <option value="28">28</option>
                                </select>
                                <span class="help-block"> {$_L['vehicle comment']}</span>
                            </div>
    
                            
                        </div>
    
    
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="description">{$_L['Description']}</label>
    
                            <div class="col-md-8">
                                <textarea id="description" name="description" class="form-control" rows="3">{$val['description']}</textarea>
    
                            </div>
                        </div>
    
    
                        <input type="hidden" name="rid" id="rid" value="{$val['id']}">
                        <input type="hidden" name="ref_img" id="ref_img" value="{$val['ref_img']}">

                    </form>
                </div>
            </div>
        </div>
    
    
        <div class="col-md-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    {$_L['Insurance Reference']}
                </div>
                <div class="ibox-content" id="ibox_form">
    
                    <form action="" class="dropzone" id="upload_container">
    
                        <div class="dz-message">
                            <h3>
                                <i class="fa fa-cloud-upload"></i> {$_L['Drop File Here']}</h3>
                            <br />
                            <span class="note">{$_L['Click to Upload']}</span>
                        </div>
    
                    </form>
    
                </div>
            </div>
    
            <div class="ibox float-e-margins">

                <div class="ibox-content" id="ibox_form" style="text-align: center; width:250">
        
                    <img src="{$baseUrl}/storage/items/thumb{$val['ref_img']}" width="250px"  >
        
                </div>

            </div>

        </div>
    
    </div>
</div>


<div class="modal-footer">
     {if $f_type eq 'edit'}  
        <button type="button" data-dismiss="modal" class="btn btn-danger">{$_L['Close']}</button>
        <button type="submit" class="btn btn-primary modal_submit" id="modal_submit">
            <i class="fa fa-check"></i> {$_L['Update']}</button>
     
     {else}
        <button type="button" data-dismiss="modal" class="btn btn-danger">{$_L['Close']}</button>
        <button type="submit" class="btn btn-primary modal_submit" id="modal_submit">
            <i class="fa fa-check"></i> {$_L['Submit']}</button>
     {/if}
</div>

<script>

    $(document).ready(function () {

        $(".progress").hide();
        $("#emsg").hide();
        $('#description').redactor(
            {
                minHeight: 200 // pixels
            }
        );

        var $vehicle_num = $('#vehicle_num');
            
        $vehicle_num.select2({

            theme: "bootstrap"

        });

        

        var _url = $("#_url").val();
        var ib_submit = $("#submit");

        var $ref_img= $("#ref_img");

        var upload_resp;

        
        // Vehicle Image upload
        var ib_file = new Dropzone("#upload_container",
            {
                url: _url + "vehicle/upload/",
                maxFiles: 1
            }
        );

        ib_file.on("sending", function () {

            ib_submit.prop('disabled', true);

        });

        ib_file.on("success", function (file, response) {

            ib_submit.prop('disabled', false);

            upload_resp = response;

            if (upload_resp.success == 'Yes') {

                toastr.success(upload_resp.msg);
                $ref_img.val(upload_resp.file);
            }
            else {
                toastr.error(upload_resp.msg);
            }

        });

        
    });
</script>