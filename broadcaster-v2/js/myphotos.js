
let myPhotos = {

    photoID:null,
    photoSrc:null,
    index:null,
    uploadModal:null,
    overLay:$('.working'),
    fullPageOverlay:$('#fullPageOverlay'),
    degreesToRotate:null,
    removeGalleryImage : function(id){
        let imageContainer = $('[data-index="'+ id+'"]');
        let parentImage = $('.image-row')[id];
        let closeGall = $('a.close')[1];
        $(parentImage).remove();
        $(imageContainer).remove();
        ui_alerts.alerts_text.text('Photo Removed Successfully!');
        ui_alerts.successAlert()
        closeGall.click();
        setTimeout(function(){
            let nextImage = $('.image-row')[myPhotos.index];
            $(nextImage).find('img').click();
            myPhotos.fullPageOverlay.hide();
        },1000);
    },
    uploadPhoto : function(event){

        let inputIndex = event.target.dataset.index;
        let fileCount = event.target.files.length;
        $('.modal-footer .btn.btn-primary').show();
        // $('#renderUploadImages').html("");
        if(fileCount > 0 || fileCount === 3){
            for(let i = 0; i < fileCount; i++){
                let reader = new FileReader();
                reader.onload = function(e){
                    let selectDiv = $('#renderUploadImages div')[inputIndex];
                    $(selectDiv).html("<img src='"+ e.target.result+"' class='img-responsive' data-index='"+inputIndex+"'>");
                };
                reader.readAsDataURL(event.target.files[i]);
            }
        }
    },
    swapCroppedImage:function(photo_id, response){
        $('input[value='+photo_id+']')
            .closest('.image-row')
            .find('img')
            .attr('src',response)
    }
};

$(function(){
    //instantiate the blueimp gallery
    $('#myPhotos .profile-img, #myPhotos .full-size').on('click', function(event){
        event = event || window.event;

        let target = event.target || event.srcElement,
            link = target.parentNode,
            options = {
                index: link,
                event: event,
                onslide: function(index, slide){
                    myPhotos.index = index;
                    myPhotos.photoID = $('#blueimp-gallery h3').text();
                    myPhotos.photoSrc = $(slide).find('img').attr('src');
                    let primeTitle = $('#blueimp-gallery .prime-pic').parent();
                    if(index === 0){
                        $('.action-icons-holder .icons').hide()
                    }else{
                        $('.action-icons-holder .icons').show();
                    }
                }
            },
            links = $('.profile-img a');
       blueimp.Gallery(links, options);
    });

    $('#blueimp-gallery .fa').on('click', function(e){
        let actionName = $(this).attr('data-action');
        if(actionName != null){
            switch (actionName) {
                case "favorite":
                    e.preventDefault();
                    let idx = myPhotos.index;
                    let imgRow = $('.image-row')[idx];
                    let radio = $(imgRow).find('input[type="radio"]');
                    $(radio).prop('checked', true);
                    console.log(radio);
                    utils.setPrimePhoto(myPhotos.photoID);
                    break;
                case "crop":
                    e.preventDefault();
                    utils.cropPhoto(myPhotos.photoID, myPhotos.photoSrc);
                    break;
                case "delete":
                    myPhotos.fullPageOverlay.show();
                    e.preventDefault();
                    utils.deleteMdPhoto(myPhotos.photoID,'gallery');
                    break;
            }
        }
    });
    $('#myPhotos .fa').on('click', function(e){

        let actionName = $(this).attr('data-name');
        let parentId = '#'+$(this).closest('.image-row').attr('id');
        let photoId = $(parentId).find('input[name="photo[]"]').val();
        let imgSrc = $(parentId).find('.profile-img>a').attr('href');

        if(actionName != null){
            e.preventDefault();
            switch (actionName) {
                case "favorite":
                    e.target.nextElementSibling.checked = true;
                    myPhotos.fullPageOverlay.show();
                    utils.setPrimePhoto(photoId);
                    break;
                case "crop":
                    utils.cropPhoto(photoId, imgSrc);
                    break;
                case "delete":
                    $(parentId).find(myPhotos.overLay)
                    .slideDown();
                    utils.deleteMdPhoto(photoId, parentId);
                    break;
            }
        }
    });

    //    open modal in upload state
    $('#uploadImages').on('click', function(){
        myPhotos.uploadModal = true;
        if(myPhotos.uploadModal){
            $('#uploadForm').show();
            $('#cropPhotos').modal('toggle');
            $('#cropPhotos h3').text('Upload New Photo')
        }
    });
    // on modal show instantiate croppie
    $('#cropPhotos').on('show.bs.modal', function(e){
        if(myPhotos.uploadModal){
            $('#upload-image').hide();
            $('#upload-image-caption').hide();
        }else{
            $('#upload-image').show();
            $('#upload-image-caption').show();
            $('#cropped_image').prop('disabled','');
        }
        $image_crop = $('#upload-image').croppie({
            enableExif: true,
            enableOrientation: true,
            viewport: {
                width: 490,
                height: 490,
                degrees:myPhotos.degreesToRotate,
                type: 'square'
            },
            boundary: {
                width: 500,
                height: 500
            }
        });

        setTimeout(function () {

            if( window.matchMedia('(max-width: 767px)').matches ){
                $('.cr-boundary').css({'width':'90%','height':'315px'});
                $('.cr-viewport.cr-vp-square').css({'width':'90%','height':'300px'});
            }
            $image_crop.croppie('bind', {
                url: myPhotos.photoSrc || '/images/wcc1/models/nophoto-large.jpg' //e.target.result
            }).then(function(){


            });
        },100);

    })
    //On modal hide
    .on('hide.bs.modal', function(){
        myPhotos.uploadModal = null;
        $('#uploadForm').hide(); //hide upload form
        $('#toBeCropped').attr('src', ""); //set image src to empty
        $('#cropPhotos h3').text('Crop Photo'); // Change modal title
        $image_crop.croppie('destroy'); //destroy croppi instance
        $("#upload-image-i").html("").hide(); //reset HTML for 2nd image
        $("#upload-image-caption").hide();
        $('#cropped_image').prop('disabled','disabled').html('<span class="text">Upload and Save</span> <i class="fa fa-refresh fa-spin" style="display: none"></i>') //reset button state
    });
    $('#uploadPhotosOnly').on('hide.bs.modal', function () {
        $('#renderUploadImages').html("")
    });
    //Fire ajax call to update cropped image
    $('#cropped_image').on('click', function (ev) {
        let _self = $(this);
        _self.find('.fa-refresh').show();
        //Process cropped image
        $image_crop.croppie('result', {
            type: 'canvas',
            size: 'viewport'
        }).then(function (response) {
            let imgInfo = $image_crop.croppie('get');
            let top_left_x = imgInfo.points[0];
            let top_left_y = imgInfo.points[1];
            let bottom_right_x = imgInfo.points[2];
            let bottom_right_y = imgInfo.points[3];

            let cropped_w = bottom_right_x - top_left_x;
            let cropped_h = bottom_right_y - top_left_y;

            console.log($image_crop.croppie('get'));
            console.log('cropped_w:'+cropped_w+" cropped_h:"+cropped_h);
            $.ajax({
                url: "/models/",
                type: "POST",
                data: {
                    "image":response,
                    "action" : 'cropImage',
                    "show" : "myphotos",
                    "user_id" : wcc.model_id,
                    "user_type" : "model",
                    "pid" : myPhotos.photoID,
                    "orientation" : imgInfo.orientation,
                    "points" : imgInfo.points,
                    "zoom" : imgInfo.zoom,
                    "x":top_left_x,
                    "y":top_left_y,
                    "height":cropped_h,
                    "width":cropped_w
                },
                success: function (data) {

                    let res = JSON.parse(data);
                    console.log(res);
                    if(res[0] === true){
                        let html = '<img src="' + response + '" class="img-responsive" />';
                        myPhotos.swapCroppedImage(myPhotos.photoID, res[1]);
                        $("#upload-image-i").html(html).show();
                        $('#upload-image-caption').show();
                        _self.find('.fa-refresh').hide();
                        // _self.find('.text').text(data);
                        _self.prop('disabled','disabled');
                        if(myPhotos.uploadModal == null){
                            let currentPhoto = $('[data-index="'+ myPhotos.index+'"]')[0];
                            $(currentPhoto).find('img').attr('src', response)
                        }
                        ui_alerts.alerts_text.text('Photo Cropped Successfully!');
                        ui_alerts.successAlert();
                        setTimeout(function () {
                            $('#cropPhotos').modal("hide");
                        },2000);

                    }

                }
            });
        });
    });
    //on image upload
    $('#imageUpload').on('change', function () {
        console.log('imageUpload fired');
        var reader = new FileReader();
        reader.onload = function (e) {
            console.log(e);
            $image_crop.croppie('bind', {
                url: e.target.result
            }).then(function(){
                console.log('bind complete');
            });
        };
        $('#upload-image').show();
        $('#upload-image-caption').show();
        $('#uploadForm').hide();
        $('#cropped_image').prop('disabled','');
        reader.readAsDataURL(this.files[0]);
    });
    // turn this on to upload images via ajax
    $('#uploadPhotosOnly form').on('submit', function (e) {
        $(e.target).find('.fa-ship').show()
    //     e.preventDefault();
    //     let data = new FormData(this);
    //     $.ajax({
    //         url:$(e.target).attr('action'),
    //         type:'POST',
    //         data:  data,
    //         contentType: false,
    //         cache: false,
    //         processData:false,
    //     })
    //     .always()
    //     .done(function(data){
    //         console.log('done')
    //     })
    //     .fail()
    });
    $('#userfile0').on('change', function(event){
        console.log('event on input', event);
        myPhotos.uploadPhoto(event)
    });
    $("[data-alert]").on('click', function(e){
        e.preventDefault();
        ui_alerts.delay = 15000;
        ui_alerts.alerts_text.html(' Primary photos can not be deleted please select another photo as your primary photo by clicking on the (<i class="fa fa-star-o"></i>) icon,\n' +
            'once your new primary photo is approved you can safely delete your previous primary photo.');
        ui_alerts.failedAlert();
    });
    $('#uploadModelPhoto').on('submit', function(e){
        e.preventDefault();
        $('.progress').show();
        $('.progress .progress-bar').css('width','50%');
        let url = $(this).attr('action');
        let form_data = new FormData(this);
        $.post({
            url:url,
            data:form_data,
            contentType: false,
            processData:false,
        }).done(function(data){

            let res = JSON.parse(data);
            console.log(res);
            ui_alerts.alerts_text.text(res[1]);
            if(res[0]){
                $('.progress .progress-bar').css('width','100%');
                ui_alerts.successAlert();
                setTimeout(function () {
                    document.location.reload()
                },2000);
            }else{
                ui_alerts.failedAlert();
                $('.progress').show();
                $('.progress .progress-bar').css('width','0');
                $('.fa.fa-refresh.fa-spin').hide();
            }
        })
    })
});
