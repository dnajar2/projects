"use strict";

/**
 * WebCamClub site class; for buy page specific functionality
 */
var Merchant = (function() {

	var _Merchant = function() {

		/**
		 *  instance copy for internal use
		 */
		var self = this;
		/**
		 * receipt information
		 */
		var _receipt = null;
        /**
         * if more than one modal is open at any giving time, set opacity to 0 on additional modals
         */
        this.controlModalOpacity = function(){
            if($('.modal-backdrop').length > 1){
                $($('.modal-backdrop')[1]).css('opacity', 0)
            }
        }
		/**
		 * process a new credit card
		 */
		this.processCreditCard = function (e) {

			if(typeof e.preventDefault !== 'undefined')
				e.preventDefault();

			$('#buy_credits').removeClass('show').addClass('hide');
			$('#newcard-processing').removeClass('hide').addClass('show');
			$('#close-newcard').removeClass('show').addClass('hide');
			$('#form_output').html('').removeClass('show').addClass('hide');

			$.ajax({
				url : $('#apm-new-card').attr('action'),
				type : $('#apm-new-card').attr('method'),
				cache : false,
				crossDomain : true,
				xhrFields : {
					withCredentials: true
				},
				data : $('#apm-new-card').serialize(),
				success : function (data, status, jqXHR) {

					var res = $.parseJSON( data );
					$('#close-newcard').removeClass('hide').addClass('show');
					$('#newcard-processing').removeClass('show').addClass('hide');
					$('#buy_credits').removeClass('hide').addClass('show');

					if( res.status ) {

						$('#add-card').modal('hide');
						self.setReceiptData(res);
						self.showReceipt();
						self.updateCreditPackages();
					}
					else {

						if(res.message == 'fb-url' && typeof res.fb_url == 'string') {

							self.redirect(res.fb_url);
						}
						else {

							$('#form_output').html( res.message ).removeClass('hide').addClass('show');
							alert( self.stripTags( res.message ) );
						}
					}
				},
				error : function (jqXHR, status, error) {

				}
			});

			return false;
		};

		/**
		 * handles an autobuy for credit packages
		 */
		this.processRebuy = function(e) {

			if( typeof e.preventDefault != 'undefined' )
				e.preventDefault();

			$('#existing-card').modal('show');
			$('#rebuy-close').removeClass('show').addClass('hide');
			$('#rebuy-message').removeClass('hide').addClass('show');
			$('#rebuy-error').removeClass('show').addClass('hide');
			$('#process-new-card').removeClass('show').addClass('hide');
			$('#form_output').html('').removeClass('show').addClass('hide');

            this.controlModalOpacity();

			$.ajax({
				url : $('#bp-rebuy').attr('action'),
				type : $('#bp-rebuy').attr('method'),
				cache : false,
				crossDomain : true,
				xhrFields : {
					withCredentials: true
				},
				data : $('#bp-rebuy').serialize(),
				success : function (data, status, jqXHR) {

					var res = $.parseJSON( data );
					if( res.status ) {

						$('#existing-card').modal('hide');

						self.setReceiptData(res);

						self.showReceipt();
						self.updateCreditPackages();
                        //update chat credits
                        if(wccAppCon.page === "chat"){
                            Remoting.getMemberInfo2();
                        }

					}
					else {

						$('#existing-card').removeAttr('backdrop');
						$('#rebuy-message').removeClass('show').addClass('hide');
						$('#rebuy-error').html(res.message).removeClass('hide').addClass('show');
						$('#process-new-card').removeClass('hide').addClass('show');
						$('#rebuy-close').removeClass('hide').addClass('show');

						if(res.message == 'fb-url' && typeof res.fb_url == 'string') {

							self.redirect(res.fb_url);
						}
						else {

							$('#form_output').html( res.message ).removeClass('hide').addClass('show');
							alert( self.stripTags( res.message ) );
						}
					}
				},
				error : function (jqXHR, status, error) {

				}
			});

			return true;
		};

		/**
		 * sets the reciept data
		 */
		this.setReceiptData = function (data) {

			if(this.is_dev){
				console.log(data);
			}
			self._receipt = data;
		};

		/**
		 * shows the receipt modal after successful purchase
		 */
		this.showReceipt = function () {

			if(typeof self._receipt == 'object' ){

				$('#txn-date').text( self._receipt.txn_date );
				$('#txn-description').text( self._receipt.description );
				$('#txn-id').text( self._receipt.txn_id );
				$('#txn-amount').text( self._receipt.txn_amount );
				$('#receipt-txn-amount').text( self._receipt.txn_amount );
				$('#txn-billed-as').text( self._receipt.txn_billed_as );
				$('#txn-billed-as-phone').text( self._receipt.txn_billed_as_phone );

				$('#receipt-txn-credits').text(self._receipt.txn_credits );
				$('#receipt-package-type').text(self._receipt.package_type);
				$('#payment-method-title').text('SELECT YOUR PAYMENT METHOD');
				$('#auth-trans-button').text('AUTHORIZE TRANSACTION');

				$('#receipt-txn-note').text(self._receipt.txn_note);

				if( self._receipt.txn_credits !== undefined ) {
				    console.log('credits ', self._receipt.txn_credits)
					$('#receipt-txn-credits-amt').text( self._receipt.txn_credits );
				}

				if(typeof self._receipt.title != 'undefined') {
					$('#receipt-txn-title').text( self._receipt.title );
				}

				if( self._receipt.btn_caption !== undefined ){
					$('#txn-receipt-redirect').text( self._receipt.btn_caption );
				}

				if( self._receipt.btn_url !== undefined ){
					$('#txn-receipt-redirect').attr( 'href', self._receipt.btn_url );
				}

				if( self._receipt.hide_mid_info ) {
					$('#txn-billed-as-lbl').removeClass('show').addClass('hide');
					$('#txn-billed-as-phone-lbl').removeClass('show').addClass('hide');
				}
				else {
					$('#txn-billed-as-lbl').removeClass('hide').addClass('show');
					$('#txn-billed-as-phone-lbl').removeClass('hide').addClass('show');
				}

				if( typeof self._receipt.auto_buy_name !== 'undefined' ) {
					$('#card-details-name').text(self._receipt.auto_buy_name);
					$('#card-onfile-name').text(self._receipt.auto_buy_name);
					$('#card-details-ccnum').text(self._receipt.auto_buy_ccnum);
					$('#card-onfile-ccnum').text(self._receipt.auto_buy_ccnum);
					$('#card-details-cctype').text(self._receipt.auto_buy_cc_type);
					$('#card-details-ccexp').text(self._receipt.auto_buy_cc_exp);
					$("#ecf").removeClass("hide");
				}

				$('#purchase-receipt').modal({});
                $('#credits_modal').modal('hide');
			}
		};

		/**
		 * sets up the page to process a new credit card if selected to do so
		 */
		this.useNewCard = function (e) {

			if( typeof e.preventDefault != 'undefined' )
				e.preventDefault();

			if( $('#existing-card').css('display') === 'block' )
				$('#existing-card').modal('toggle');


			$('#add-card').modal({
				backdrop: 'static',
				keyboard: false
			});

            this.controlModalOpacity();

			return false;
		};

		/**
		 * updates the billing bid when a new method is detected
		 */
		this.updateMid = function ( pm_id, callback ) {

			if( ! this.mid_can_change ) {

				return;
			}

			var pm_data = {};
			pm_data.payment_method_id = pm_id;
			$('#cc_payment_method_id').val( pm_id );

			$.ajax({
				url: '/members/ajax/get_mid.php',
				type: 'POST',
				data: pm_data,
				crossDomain : true,
				xhrFields : {
					withCredentials: true
				},
				success : function (data, status, jqXHR) {

					var mid = $.parseJSON( data );
					$('#mid_id').val( mid.id );
					if( $('#mid_bill_domain') ) {
						$('#mid_bill_domain').html(mid.domain);
					}
					if( $('#mid_phone') ) {
						$('#mid_phone').html(mid.phone);
					}
					if( $('#mid_notice') ) {
						$('#mid_notice').html(mid.notice);
					}
					if( typeof callback == 'function' ) {
						callback( mid );
					}

				},
				error : function(jqXHR, status, error){

				}
			});
		};

		/**
		 * updates the credit packages removing any that can no longer be purchased
		 */
		this.updateCreditPackages = function () {

		};
        /**
         *
         * @type {{getData: Merchant.buyModal.getData, build: Merchant.buyModal.build, buildCreditCell: Merchant.buyModal.buildCreditCell, buildMembershipCell: Merchant.buyModal.buildMembershipCell, offset: Merchant.buyModal.offset}}
         * Flow of functions controlling buy modal.
         */
        var t1 = null;
        var t2 = null;

		this.buyModal = {

            getData:function(){
                t1 = performance.now();
                $('#creditsSpan').hide()
                $('#creditsSpinner').show();
                var data = {
                    options:'credits',
                    member_id:wcc.member_id
                }
                data[wcc.sid_name] = wcc.sid

                var url = window.origin || location.origin;
                url += '/api/members/products.php';
                var args = {
                    data:data,
                    url:url,
                };
                Members.ajaxCall(args, this.build);
            },
            build:function(resp){
                // console.log('build ', resp)
                if(!resp.daily_limit_reached){
                    //credit packages
                    if(resp.credit_packages){
                        Merchant.buyModal.buildCreditCell(resp.credit_packages);
                        Merchant.buyModal.offset('#credits_width .package-box')
                    }
                    //memberships
                    if(resp.membership_packages){

                        Merchant.buyModal.buildMembershipCell(resp.membership_packages);
                        Merchant.buyModal.offset('#memberships .package-box')
                    }else{
                        $('#memberships_lead, #memberships, #optionOne').hide()
                    }
                    if(resp.auto_buy_data){
                        //has bought
                        $('#credits_modal .modal-title').text('Buy Credits')
                    }
                    if(resp.auto_buy_data){
                        $('#ecf').removeClass('hide')
                        $('#card-onfile-name').text(resp.auto_buy_data.first_name +" "+ resp.auto_buy_data.last_name)
                        $('#card-onfile-ccnum').text(resp.auto_buy_data.cc_num_masked)
                    }
                }else{
                    $('#credit_packages_cells').hide().removeClass('show');
                    $('#limit-reached').show().removeClass('hide');
                    $('#credits_modal .modal-title').text('Limit Reached')
                }
                $('#credits_modal').modal('show');
                t2 = performance.now();
                var num = Number(t2 - t1) / 1000;

                    console.log("Time Elapsed: " + num.toFixed(2) + " seconds.");

            },
            buildCreditCell:function(data){

                var cell = "";
                if(typeof data === 'object'){
                    $.each(data, function(index, data){
                        var activeClass = ""
                        var display = ""
                        var action = ""
                        if(data.is_popular){
                            activeClass = "popular primary-border credit-package-selected";
                            display = "show";
                            action = "SELECTED"
                        }else{
                            activeClass = "credit-package";
                            display = "hide";
                            action = "SELECT"
                        }
                        cell += '<div id="package_'+data.credit_id+'" class="package-box '+activeClass+' col-sm-2">'
                        cell += '<span class="package-id hide">'+data.credit_id+'</span>'
                        cell += '<span class="package-type hide">credits</span>'
                        cell += '<span class="num-free-tickets hide"></span>'
                        cell += '<span class="free-tickets-value hide"></span>'
                        cell += '<div class="popular-title primary-bg-color '+display+'">'
                        cell +=  data.is_popular ?'POPULAR!':'';
                        cell += '</div>'
                        cell += '<div class="credit-amount">'
                        cell +=     data.credits
                        cell += '   </div>'
                        cell += '    <div class="credit-amount-subtitle credits-spacer">'
                        cell += '        CREDITS'
                        cell += '    <br><small> &nbsp; </small>'
                        cell += '    </div>'
                        cell += '    <div class="credit-value">'
                        cell += '        $'+data.price
                        cell += '    </div>'
                        cell += '    <div class="selected">'
                        cell += '    <span class="show">'+action+'</span>'
                        cell += '    </div>'
                        cell += '</div>';
                    });
                    $('#credits_width').html(cell);

                }
            },
            buildMembershipCell:function(data){
                var cell = ""
                $.each(data, function(index, item){
                    // console.log('buildMembershipCell', index, item);
                    var packageName = item.name;
                    packageName = packageName.split(" ")[0];

                    cell += '<div id="membershipId_'+item.credit_id+'" class="credit-package package-box col-sm-2">\n' +
                        '\t\t\t\t\t<span class="package-id hide">'+item.credit_id+'</span>\n' +
                        '\t\t\t\t\t<span class="package-type hide">membership</span>\n' +
                        '\t\t\t\t\t<span class="num-free-tickets hide"></span>\n' +
                        '\t\t\t\t\t<span class="free-tickets-value hide"></span>\n' +
                        '\t\t\t\t\t<div class="popular-title">\n' +
                        '\t\t\t\t\t\t'+packageName+'\n' +
                        '\t\t\t\t\t</div>\n' +
                        '\t\t\t\t\t<div class="credit-amount ">\n' +
                        '\t\t\t\t\t\t '+item.credits+'\n' +
                        '\t\t\t\t\t</div>\n' +
                        '\t\t\t\t\t<div class="credit-amount-subtitle credits-spacer">\n' +
                        '\t\t\t\t\t\tCREDITS\n' +
                        '\t\t\t\t\t\t<br><small> &nbsp; </small>\n' +
                        '\t\t\t\t\t</div>\n' +
                        '\t\t\t\t\t<div class="credit-value">\n' +
                        '\t\t\t\t\t\t$'+item.price+'\n' +
                        '\t\t\t\t\t</div>\n' +
                        '\t\t\t\t\t<div class="selected">\n' +
                        '\t\t\t\t\t\t<span class="show">SELECT</span>\n' +
                        '\t\t\t\t\t</div>\n' +
                        '\t\t\t\t</div>'
                });
                $('#memberships').html(cell);
            },
            offset:function(section){
                var creditPkgs = $(section).length
                var offset = ( 6 - creditPkgs);
                if(offset > 0){
                    $(section).first().addClass('col-sm-offset-'+offset);
                }
                // console.log(offset)
            },
            packageTitle:function(){
                var popularTitle = $.trim($('.credit-package-selected .popular-title').text());
                var append = ""
                console.log("popularTitle", popularTitle)
                if(popularTitle !== 'POPULAR!'){
                    append = $('.credit-package-selected .package-type').text()
                }
                var title = popularTitle + ' ' + append;
                if( $('#add-card').hasClass('in')){
                    $('#add-card .cardOnFleTitle').html(title)
                }
                else if($('#existing-card').hasClass('in')){
                    $('#existing-card .cardOnFleTitle ').html(title)
                }
            }
        }

	};

	return _Merchant;

})();

var Merchant = new Merchant();
$.extend(Merchant, Members);

$(document).ready(function() {
    //run on chat page
    if(wcc.page == 'chat'){
        $('body').on('click','#purchaseBtn', function(){
            if(!$('.package-box').length){
                Merchant.buyModal.getData()
            }
        });
    }

    $('#mobile_credits_text').on('click', function(){
        $(this).hide();
        $('.creditsSpinner').show()
    });
    $('#table_credits_text').on('click', function(){
        $(this).hide();
        $('.creditsSpinner').show()
    })

	$('#add-card').on('show.bs.modal', function() {
        $('#credits_modal').modal('hide');

	});

	$('#add-card').on('hide.bs.modal', function (e) {

		if($('.selected').parent().hasClass('credit-package-selected')) {
			$('.selected').parent().click();
		}

		$('#auth-trans-button').text('AUTHORIZE TRANSACTION');
		$('.apm-new-card-input').val('');


	});

	$('#existing-card').on('show.bs.modal', function() {
        $('#credits_modal').modal('hide');


	});

	$('#existing-card').on('hide.bs.modal', function (e) {
        $('#credits_width').empty();
        $('#memberships').empty()
	});

	$('#purchase-receipt').on('show.bs.modal', function() {

	});

	$('#purchase-receipt').on('hide.bs.modal', function (e) {

	});
    //credits toggle on credits_modal show
    $('#credits_modal').on('show.bs.modal', function(){
        $('#creditsSpan').show();
        $('#creditsSpinner').hide();
        //mobile icons
        $('.creditsSpinner').hide();
        $('#mobile_credits_text').show();
        $('#table_credits_text').show();
    });

    $('#credits_modal').on('hide.bs.modal', function(){
    })
});
