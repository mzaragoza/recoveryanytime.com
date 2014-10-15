/*!
 * Product:        Social - Premium Responsive Admin Template
 * Version:        2.1.2
 * Copyright:      2014 cesarlab.com
 * License:        http://themeforest.net/licenses
 * Live Preview:   http://go.cesarlab.com/SocialAdminTemplate2
 * Purchase:       http://go.cesarlab.com/PurchaseSocial2
 */
if (typeof jQuery === 'undefined') { throw new Error('Social\'s JavaScript requires jQuery'); }

var FormStuff;

FormStuff = (function($) {
  "use strict";
  var initFormValidation, initFormWizards, initGeneralItems;
  initGeneralItems = function() {

    /* General Items
     */
    var cb, optionSet1;
    $("#icheck-example input").iCheck({
      checkboxClass: "icheckbox_square-grey",
      radioClass: "iradio_square-grey"
    });
    $("#selectize-examples .single").selectize({
      create: true,
      sortField: "text"
    });
    $("#selectize-examples .groups").selectize({
      sortField: "text"
    });
    $("#selectize-examples .multiple").selectize({
      plugins: ["remove_button"],
      delimiter: ",",
      persist: false,
      create: function(input) {
        return {
          value: input,
          text: input
        };
      }
    });
    $("#select2-examples").find(".single, .groups").select2();
    $("#select2-examples .tag").select2({
      tags: ["red", "green", "blue"],
      tokenSeparators: [",", " "]
    });

    /* */
    $("#datetimepicker1").datetimepicker({
      icons: {
        time: "fa fa-clock-o",
        date: "fa fa-calendar",
        up: "fa fa-arrow-up",
        down: "fa fa-arrow-down"
      }
    });

    /* */
    $("#datetimepicker2").datetimepicker({
      icons: {
        time: "fa fa-clock-o",
        date: "fa fa-calendar",
        up: "fa fa-arrow-up",
        down: "fa fa-arrow-down"
      },
      pickDate: false
    });

    /* */
    $("#colorpicker1").colorpicker();

    /* */
    $("#daterangepicker1").daterangepicker(null, function(start, end, label) {
      console.log(start.toISOString(), end.toISOString(), label);
    });
    cb = function(start, end, label) {
      console.log(start.toISOString(), end.toISOString(), label);
      $("#reportrange span").html(start.format("MMMM D, YYYY") + " - " + end.format("MMMM D, YYYY"));
    };
    optionSet1 = {
      startDate: moment().subtract("days", 29),
      endDate: moment(),
      minDate: "01/01/2012",
      maxDate: "12/31/2014",
      dateLimit: {
        days: 60
      },
      showDropdowns: true,
      showWeekNumbers: true,
      timePicker: false,
      timePickerIncrement: 1,
      timePicker12Hour: true,
      ranges: {
        Today: [moment(), moment()],
        Yesterday: [moment().subtract("days", 1), moment().subtract("days", 1)],
        "Last 7 Days": [moment().subtract("days", 6), moment()],
        "Last 30 Days": [moment().subtract("days", 29), moment()],
        "This Month": [moment().startOf("month"), moment().endOf("month")],
        "Last Month": [moment().subtract("month", 1).startOf("month"), moment().subtract("month", 1).endOf("month")]
      },
      opens: "left",
      buttonClasses: ["btn btn-sm"],
      applyClass: "btn-primary",
      cancelClass: "btn-danger",
      format: "MM/DD/YYYY",
      separator: " to ",
      locale: {
        applyLabel: "Submit",
        cancelLabel: "Clear",
        fromLabel: "From",
        toLabel: "To",
        customRangeLabel: "Custom",
        daysOfWeek: ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"],
        monthNames: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
        firstDay: 1
      }
    };
    $("#reportrange span").html(moment().subtract("days", 29).format("MMMM D, YYYY") + " - " + moment().format("MMMM D, YYYY"));
    $("#reportrange").daterangepicker(optionSet1, cb);
    $("#reportrange").on("show.daterangepicker", function() {
      console.log("show event fired");
    });
    $("#reportrange").on("hide.daterangepicker", function() {
      console.log("hide event fired");
    });
    $("#reportrange").on("apply.daterangepicker", function(ev, picker) {
      console.log("apply event fired, start/end dates are " + picker.startDate.format("MMMM D, YYYY") + " to " + picker.endDate.format("MMMM D, YYYY"));
    });

    /* Masked imputs */
    $.mask.definitions["~"] = "[+-]";
    $("#date").mask("99/99/9999");
    $("#phone").mask("(999) 999-9999");
    $("#phoneext").mask("(999) 999-9999? x99999");
    $("#tin").mask("99-9999999");
    $("#ssn").mask("999-99-9999");

    /* Bootstrap Switchs */
    $("#bootstrapSwitchs [type='checkbox']").bootstrapSwitch();
  };
  initFormValidation = function() {

    /* Advanced form validation */
    $("#advanced-form #username").focus(function() {
      var firstname, lastname;
      firstname = $("#firstname").val();
      lastname = $("#lastname").val();
      if (firstname && lastname && !this.value) {
        this.value = firstname + "." + lastname;
      }
    });
    $("#advanced-form #website").bind("focus", function(e) {
      if ($.trim($(e.target).val()) === "") {
        $(e.target).val("http://");
      }
    });
    $("#advanced-form").validate({
      rules: {
        title: {
          required: true,
          min: 1
        },
        firstname: {
          required: true,
          minlength: 2
        },
        lastname: {
          required: true,
          minlength: 2
        },
        username: {
          required: true,
          minlength: 2,
          maxlength: 10
        },
        password1: {
          required: true,
          minlength: 6,
          maxlength: 12
        },
        password2: {
          required: true,
          minlength: 6,
          equalTo: "#password1"
        },
        email: {
          required: true,
          email: true
        },
        birthday: {
          required: true,
          dateformat: true
        },
        website: {
          required: true,
          url: true
        },
        gender: {
          required: true
        },
        agree: "required"
      },
      messages: {
        title: {
          min: "Chose an option"
        },
        gender: {
          min: "Chose an option"
        }
      },
      highlight: function(element) {
        $(element).closest(".form-group").addClass("has-error has-feedback");
      },
      unhighlight: function(element) {
        $(element).closest(".form-group").removeClass("has-error has-feedback");
        $(element).closest(".form-group").find(".form-control-feedback").remove();
      },
      errorElement: "span",
      errorClass: "help-block",
      errorPlacement: function(error, element) {
        var control_feedback;
        control_feedback = '<span class="fa fa-times form-control-feedback"></span>';
        if (element.parent(".input-group").length) {
          error.insertAfter(element.parent());
          $(control_feedback).insertAfter(element.parent());
        } else {
          error.insertAfter(element);
          $(control_feedback).insertAfter(element);
        }
      },
      submitHandler: function(form) {
        return $("#advanced-form button[class='btn btn-primary']").button("loading");
      }
    });
  };
  initFormWizards = function() {};
  return {
    initGeneralItems: initGeneralItems,
    initFormValidation: initFormValidation,
    initFormWizards: initFormWizards
  };
})(jQuery);
