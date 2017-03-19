// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require selectize
//= require_tree .

function showAgreementForm(overlayClass, formWrapperClass){
    var overlay = $(overlayClass);
    var formWrapper = $(formWrapperClass);
    overlay.addClass("fadeIn");
    formWrapper.addClass("slideInUp");
    overlay.show();
    formWrapper.show();
    setTimeout(function(){
        overlay.removeClass("fadeIn");
        formWrapper.removeClass("slideInUp");
    }, 500);
}

function hideAgreementForm(overlayClass, formWrapperClass){
    var overlay = $(overlayClass);
    var formWrapper = $(formWrapperClass);
    overlay.addClass("fadeOut");
    formWrapper.addClass("fadeOutDown");
    setTimeout(function(){
        overlay.removeClass("fadeOut");
        formWrapper.removeClass("fadeOutDown");
        overlay.hide();
        formWrapper.hide();
    }, 500);
}

$(document).ready(function(e) {

    $('#address_agreement_id').selectize({});
    $('#agreement_company_id').selectize({});

    $('.addresses-container .select-address').selectize({
        placeholder: 'Поиск обьекта',
        allowEmptyOption: true,
        items: null,
        onChange: function(){
            $('form.address_search').submit();
        }
    });

    $('.agreements-container .select-agreement').selectize({
        placeholder: 'Поиск договора',
        allowEmptyOption: true,
        items: null,
        onChange: function(){
            $('form.agreement_search').submit();
        }
    });

    $('.companies-container .select-company').selectize({
        placeholder: 'Поиск компании',
        allowEmptyOption: true,
        items: null,
        onChange: function(){
            $('form.company_search').submit();
        }
    });

    $('.agreements-container .create-link').click(function(){
        showAgreementForm('.agreement-form-overlay', '.agreement-form-wrapper');
    });

    $('.agreement-form-overlay').click(function(){
        hideAgreementForm('.agreement-form-overlay', '.agreement-form-wrapper');
    });

    $('.addresses-container .create-link').click(function(){
        showAgreementForm('.address-form-overlay', '.address-form-wrapper');
    });

    $('.address-form-overlay').click(function(){
        hideAgreementForm('.address-form-overlay', '.address-form-wrapper');
    });

    $('.companies-container .create-link').click(function(){
        showAgreementForm('.company-form-overlay', '.company-form-wrapper');
    });

    $('.company-form-overlay').click(function(){
        hideAgreementForm('.company-form-overlay', '.company-form-wrapper');
    });
});