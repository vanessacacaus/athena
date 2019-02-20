(function($){

  // Store the initial location.hash so that the event isn't triggered when
  // the page is first loaded.
  var last_hash = location.hash,

    // An id with which the polling loop can be canceled.
    timeout_id;

  // Special event definition.
  $.event.special.hashchange = {
    setup: function() {
      // If the event is supported natively, return false so that jQuery
      // will bind to the event using DOM methods instead of using the
      //  polling loop.
      if ( 'onhashchange' in window ) { return false; }

      // Start the polling loop if it's not already running.
      start();
    },
    teardown: function() {
      // If the event is supported natively, return false so that jQuery
      // will bind to the event using DOM methods instead of using the
      // polling loop.
      if ( 'onhashchange' in window ) { return false; }

      // Stop the polling loop. Since this event is only evern bound to
      // the `window` object, multiple-element tracking is unnecessary.
      stop();
    },
    add: function( handleObj ) {
      // Save a reference to the bound event handler.
      var old_handler = handleObj.handler;

      // This function will now be called when the event is triggered,
      // instead of the bound event handler.
      handleObj.handler = function(event) {

        // Augment the event object with the location.hash at the time
        // the event was triggered.
        event.fragment = location.hash.replace( /^#/, '' );

        // Call the originally-bound event handler, complete with modified
        // event object! The result from this call doesn't need to be
        // returned, because there is no default action to prevent, and 
        // nothing to propagate to.
        old_handler.apply( this, arguments );
      };
    }
  };

  // Start (or continue) the polling loop.
  function start() {
    // Stop the polling loop if it has already started.
    stop();

    // Get the current location.hash. If is has changed since the last loop
    // iteration, store that value and trigger the hashchange event.
    var hash = location.hash;
    if ( hash !== last_hash ) {
      $(window).trigger( 'hashchange' );
      last_hash = hash;
    }

    // Poll, setting timeout_id so the polling loop can be canceled.
    timeout_id = setTimeout( start, 100 );
  };

  // Stop the polling loop.
  function stop() {
    clearTimeout( timeout_id );
  };

})(jQuery);


/************************ Datetimepicker addon begin  *****************************************/
/*
* jQuery timepicker addon
* By: Trent Richardson [http://trentrichardson.com]
* Version 0.9.9
* Last Modified: 02/05/2012
* 
* Copyright 2012 Trent Richardson
* Dual licensed under the MIT and GPL licenses.
* http://trentrichardson.com/Impromptu/GPL-LICENSE.txt
* http://trentrichardson.com/Impromptu/MIT-LICENSE.txt
* 
* HERES THE CSS:
* .ui-timepicker-div .ui-widget-header { margin-bottom: 8px; }
* .ui-timepicker-div dl { text-align: left; }
* .ui-timepicker-div dl dt { height: 25px; margin-bottom: -25px; }
* .ui-timepicker-div dl dd { margin: 0 10px 10px 65px; }
* .ui-timepicker-div td { font-size: 90%; }
* .ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }
*/

(function($) {

$.extend($.ui, { timepicker: { version: "0.9.9" } });

/* Time picker manager.
   Use the singleton instance of this class, $.timepicker, to interact with the time picker.
   Settings for (groups of) time pickers are maintained in an instance object,
   allowing multiple different settings on the same page. */

function Timepicker() {
	this.regional = []; // Available regional settings, indexed by language code
	this.regional[''] = { // Default regional settings
		currentText: 'Now',
		closeText: 'Done',
		ampm: false,
		amNames: ['AM', 'A'],
		pmNames: ['PM', 'P'],
		timeFormat: 'hh:mm tt',
		timeSuffix: '',
		timeOnlyTitle: 'Choose Time',
		timeText: 'Time',
		hourText: 'Hour',
		minuteText: 'Minute',
		secondText: 'Second',
		millisecText: 'Millisecond',
		timezoneText: 'Time Zone'
	};
	this._defaults = { // Global defaults for all the datetime picker instances
		showButtonPanel: true,
		timeOnly: false,
		showHour: true,
		showMinute: true,
		showSecond: false,
		showMillisec: false,
		showTimezone: false,
		showTime: true,
		stepHour: 1,
		stepMinute: 1,
		stepSecond: 1,
		stepMillisec: 1,
		hour: 0,
		minute: 0,
		second: 0,
		millisec: 0,
		timezone: '+0000',
		hourMin: 0,
		minuteMin: 0,
		secondMin: 0,
		millisecMin: 0,
		hourMax: 23,
		minuteMax: 59,
		secondMax: 59,
		millisecMax: 999,
		minDateTime: null,
		maxDateTime: null,
		onSelect: null,
		hourGrid: 0,
		minuteGrid: 0,
		secondGrid: 0,
		millisecGrid: 0,
		alwaysSetTime: true,
		separator: ' ',
		altFieldTimeOnly: true,
		showTimepicker: true,
		timezoneIso8609: false,
		timezoneList: null,
		addSliderAccess: false,
		sliderAccessArgs: null
	};
	$.extend(this._defaults, this.regional['']);
};

$.extend(Timepicker.prototype, {
	$input: null,
	$altInput: null,
	$timeObj: null,
	inst: null,
	hour_slider: null,
	minute_slider: null,
	second_slider: null,
	millisec_slider: null,
	timezone_select: null,
	hour: 0,
	minute: 0,
	second: 0,
	millisec: 0,
	timezone: '+0000',
	hourMinOriginal: null,
	minuteMinOriginal: null,
	secondMinOriginal: null,
	millisecMinOriginal: null,
	hourMaxOriginal: null,
	minuteMaxOriginal: null,
	secondMaxOriginal: null,
	millisecMaxOriginal: null,
	ampm: '',
	formattedDate: '',
	formattedTime: '',
	formattedDateTime: '',
	timezoneList: null,

	/* Override the default settings for all instances of the time picker.
	   @param  settings  object - the new settings to use as defaults (anonymous object)
	   @return the manager object */
	setDefaults: function(settings) {
		extendRemove(this._defaults, settings || {});
		return this;
	},

	//########################################################################
	// Create a new Timepicker instance
	//########################################################################
	_newInst: function($input, o) {
		var tp_inst = new Timepicker(),
			inlineSettings = {};
			
		for (var attrName in this._defaults) {
			var attrValue = $input.attr('time:' + attrName);
			if (attrValue) {
				try {
					inlineSettings[attrName] = eval(attrValue);
				} catch (err) {
					inlineSettings[attrName] = attrValue;
				}
			}
		}
		tp_inst._defaults = $.extend({}, this._defaults, inlineSettings, o, {
			beforeShow: function(input, dp_inst) {
				if ($.isFunction(o.beforeShow))
					return o.beforeShow(input, dp_inst, tp_inst);
			},
			onChangeMonthYear: function(year, month, dp_inst) {
				// Update the time as well : this prevents the time from disappearing from the $input field.
				tp_inst._updateDateTime(dp_inst);
				if ($.isFunction(o.onChangeMonthYear))
					o.onChangeMonthYear.call($input[0], year, month, dp_inst, tp_inst);
			},
			onClose: function(dateText, dp_inst) {
				if (tp_inst.timeDefined === true && $input.val() != '')
					tp_inst._updateDateTime(dp_inst);
				if ($.isFunction(o.onClose))
					o.onClose.call($input[0], dateText, dp_inst, tp_inst);
			},
			timepicker: tp_inst // add timepicker as a property of datepicker: $.datepicker._get(dp_inst, 'timepicker');
		});
		tp_inst.amNames = $.map(tp_inst._defaults.amNames, function(val) { return val.toUpperCase() });
		tp_inst.pmNames = $.map(tp_inst._defaults.pmNames, function(val) { return val.toUpperCase() });

		if (tp_inst._defaults.timezoneList === null) {
			var timezoneList = [];
			for (var i = -11; i <= 12; i++)
				timezoneList.push((i >= 0 ? '+' : '-') + ('0' + Math.abs(i).toString()).slice(-2) + '00');
			if (tp_inst._defaults.timezoneIso8609)
				timezoneList = $.map(timezoneList, function(val) {
					return val == '+0000' ? 'Z' : (val.substring(0, 3) + ':' + val.substring(3));
				});
			tp_inst._defaults.timezoneList = timezoneList;
		}

		tp_inst.hour = tp_inst._defaults.hour;
		tp_inst.minute = tp_inst._defaults.minute;
		tp_inst.second = tp_inst._defaults.second;
		tp_inst.millisec = tp_inst._defaults.millisec;
		tp_inst.ampm = '';
		tp_inst.$input = $input;

		if (o.altField)
			tp_inst.$altInput = $(o.altField)
				.css({ cursor: 'pointer' })
				.focus(function(){ $input.trigger("focus"); });
		
		if(tp_inst._defaults.minDate==0 || tp_inst._defaults.minDateTime==0)
		{
			tp_inst._defaults.minDate=new Date();
		}
		if(tp_inst._defaults.maxDate==0 || tp_inst._defaults.maxDateTime==0)
		{
			tp_inst._defaults.maxDate=new Date();
		}
		
		// datepicker needs minDate/maxDate, timepicker needs minDateTime/maxDateTime..
		if(tp_inst._defaults.minDate !== undefined && tp_inst._defaults.minDate instanceof Date)
			tp_inst._defaults.minDateTime = new Date(tp_inst._defaults.minDate.getTime());
		if(tp_inst._defaults.minDateTime !== undefined && tp_inst._defaults.minDateTime instanceof Date)
			tp_inst._defaults.minDate = new Date(tp_inst._defaults.minDateTime.getTime());
		if(tp_inst._defaults.maxDate !== undefined && tp_inst._defaults.maxDate instanceof Date)
			tp_inst._defaults.maxDateTime = new Date(tp_inst._defaults.maxDate.getTime());
		if(tp_inst._defaults.maxDateTime !== undefined && tp_inst._defaults.maxDateTime instanceof Date)
			tp_inst._defaults.maxDate = new Date(tp_inst._defaults.maxDateTime.getTime());
		return tp_inst;
	},

	//########################################################################
	// add our sliders to the calendar
	//########################################################################
	_addTimePicker: function(dp_inst) {
		var currDT = (this.$altInput && this._defaults.altFieldTimeOnly) ?
				this.$input.val() + ' ' + this.$altInput.val() : 
				this.$input.val();

		this.timeDefined = this._parseTime(currDT);
		this._limitMinMaxDateTime(dp_inst, false);
		this._injectTimePicker();
	},

	//########################################################################
	// parse the time string from input value or _setTime
	//########################################################################
	_parseTime: function(timeString, withDate) {
		var regstr = this._defaults.timeFormat.toString()
				.replace(/h{1,2}/ig, '(\\d?\\d)')
				.replace(/m{1,2}/ig, '(\\d?\\d)')
				.replace(/s{1,2}/ig, '(\\d?\\d)')
				.replace(/l{1}/ig, '(\\d?\\d?\\d)')
				.replace(/t{1,2}/ig, this._getPatternAmpm())
				.replace(/z{1}/ig, '(z|[-+]\\d\\d:?\\d\\d)?')
				.replace(/\s/g, '\\s?') + this._defaults.timeSuffix + '$',
			order = this._getFormatPositions(),
			ampm = '',
			treg;

		if (!this.inst) this.inst = $.datepicker._getInst(this.$input[0]);

		if (withDate || !this._defaults.timeOnly) {
			// the time should come after x number of characters and a space.
			// x = at least the length of text specified by the date format
			var dp_dateFormat = $.datepicker._get(this.inst, 'dateFormat');
			// escape special regex characters in the seperator
			var specials = new RegExp("[.*+?|()\\[\\]{}\\\\]", "g");
			regstr = '^.{' + dp_dateFormat.length + ',}?' + this._defaults.separator.replace(specials, "\\$&") + regstr;
		}
		
		treg = timeString.match(new RegExp(regstr, 'i'));

		if (treg) {
			if (order.t !== -1) {
				if (treg[order.t] === undefined || treg[order.t].length === 0) {
					ampm = '';
					this.ampm = '';
				} else {
					ampm = $.inArray(treg[order.t].toUpperCase(), this.amNames) !== -1 ? 'AM' : 'PM';
					this.ampm = this._defaults[ampm == 'AM' ? 'amNames' : 'pmNames'][0];
				}
			}

			if (order.h !== -1) {
				if (ampm == 'AM' && treg[order.h] == '12')
					this.hour = 0; // 12am = 0 hour
				else if (ampm == 'PM' && treg[order.h] != '12')
					this.hour = (parseFloat(treg[order.h]) + 12).toFixed(0); // 12pm = 12 hour, any other pm = hour + 12
				else this.hour = Number(treg[order.h]);
			}

			if (order.m !== -1) this.minute = Number(treg[order.m]);
			if (order.s !== -1) this.second = Number(treg[order.s]);
			if (order.l !== -1) this.millisec = Number(treg[order.l]);
			if (order.z !== -1 && treg[order.z] !== undefined) {
				var tz = treg[order.z].toUpperCase();
				switch (tz.length) {
				case 1:	// Z
					tz = this._defaults.timezoneIso8609 ? 'Z' : '+0000';
					break;
				case 5:	// +hhmm
					if (this._defaults.timezoneIso8609)
						tz = tz.substring(1) == '0000'
						   ? 'Z'
						   : tz.substring(0, 3) + ':' + tz.substring(3);
					break;
				case 6:	// +hh:mm
					if (!this._defaults.timezoneIso8609)
						tz = tz == 'Z' || tz.substring(1) == '00:00'
						   ? '+0000'
						   : tz.replace(/:/, '');
					else if (tz.substring(1) == '00:00')
						tz = 'Z';
					break;
				}
				this.timezone = tz;
			}
			
			return true;

		}
		return false;
	},

	//########################################################################
	// pattern for standard and localized AM/PM markers
	//########################################################################
	_getPatternAmpm: function() {
		var markers = [];
			o = this._defaults;
		if (o.amNames)
			$.merge(markers, o.amNames);
		if (o.pmNames)
			$.merge(markers, o.pmNames);
		markers = $.map(markers, function(val) { return val.replace(/[.*+?|()\[\]{}\\]/g, '\\$&') });
		return '(' + markers.join('|') + ')?';
	},

	//########################################################################
	// figure out position of time elements.. cause js cant do named captures
	//########################################################################
	_getFormatPositions: function() {
		var finds = this._defaults.timeFormat.toLowerCase().match(/(h{1,2}|m{1,2}|s{1,2}|l{1}|t{1,2}|z)/g),
			orders = { h: -1, m: -1, s: -1, l: -1, t: -1, z: -1 };

		if (finds)
			for (var i = 0; i < finds.length; i++)
				if (orders[finds[i].toString().charAt(0)] == -1)
					orders[finds[i].toString().charAt(0)] = i + 1;

		return orders;
	},

	//########################################################################
	// generate and inject html for timepicker into ui datepicker
	//########################################################################
	_injectTimePicker: function() {
		var $dp = this.inst.dpDiv,
			o = this._defaults,
			tp_inst = this,
			// Added by Peter Medeiros:
			// - Figure out what the hour/minute/second max should be based on the step values.
			// - Example: if stepMinute is 15, then minMax is 45.
			hourMax = parseInt((o.hourMax - ((o.hourMax - o.hourMin) % o.stepHour)) ,10),
			minMax  = parseInt((o.minuteMax - ((o.minuteMax - o.minuteMin) % o.stepMinute)) ,10),
			secMax  = parseInt((o.secondMax - ((o.secondMax - o.secondMin) % o.stepSecond)) ,10),
			millisecMax  = parseInt((o.millisecMax - ((o.millisecMax - o.millisecMin) % o.stepMillisec)) ,10),
			dp_id = this.inst.id.toString().replace(/([^A-Za-z0-9_])/g, '');

		// Prevent displaying twice
		//if ($dp.find("div#ui-timepicker-div-"+ dp_id).length === 0) {
		if ($dp.find("div#ui-timepicker-div-"+ dp_id).length === 0 && o.showTimepicker) {
			var noDisplay = ' style="display:none;"',
				html =	'<div class="ui-timepicker-div" id="ui-timepicker-div-' + dp_id + '"><dl>' +
						'<dt class="ui_tpicker_time_label" id="ui_tpicker_time_label_' + dp_id + '"' +
						((o.showTime) ? '' : noDisplay) + '>' + o.timeText + '</dt>' +
						'<dd class="ui_tpicker_time" id="ui_tpicker_time_' + dp_id + '"' +
						((o.showTime) ? '' : noDisplay) + '></dd>' +
						'<dt class="ui_tpicker_hour_label" id="ui_tpicker_hour_label_' + dp_id + '"' +
						((o.showHour) ? '' : noDisplay) + '>' + o.hourText + '</dt>',
				hourGridSize = 0,
				minuteGridSize = 0,
				secondGridSize = 0,
				millisecGridSize = 0,
				size;

 			// Hours
			html += '<dd class="ui_tpicker_hour"><div id="ui_tpicker_hour_' + dp_id + '"' +
						((o.showHour) ? '' : noDisplay) + '></div>';
			if (o.showHour && o.hourGrid > 0) {
				html += '<div style="padding-left: 1px"><table class="ui-tpicker-grid-label"><tr>';

				for (var h = o.hourMin; h <= hourMax; h += parseInt(o.hourGrid,10)) {
					hourGridSize++;
					var tmph = (o.ampm && h > 12) ? h-12 : h;
					if (tmph < 10) tmph = '0' + tmph;
					if (o.ampm) {
						if (h == 0) tmph = 12 +'a';
						else if (h < 12) tmph += 'a';
						else tmph += 'p';
					}
					html += '<td>' + tmph + '</td>';
				}

				html += '</tr></table></div>';
			}
			html += '</dd>';

			// Minutes
			html += '<dt class="ui_tpicker_minute_label" id="ui_tpicker_minute_label_' + dp_id + '"' +
					((o.showMinute) ? '' : noDisplay) + '>' + o.minuteText + '</dt>'+
					'<dd class="ui_tpicker_minute"><div id="ui_tpicker_minute_' + dp_id + '"' +
							((o.showMinute) ? '' : noDisplay) + '></div>';

			if (o.showMinute && o.minuteGrid > 0) {
				html += '<div style="padding-left: 1px"><table class="ui-tpicker-grid-label"><tr>';

				for (var m = o.minuteMin; m <= minMax; m += parseInt(o.minuteGrid,10)) {
					minuteGridSize++;
					html += '<td>' + ((m < 10) ? '0' : '') + m + '</td>';
				}

				html += '</tr></table></div>';
			}
			html += '</dd>';

			// Seconds
			html += '<dt class="ui_tpicker_second_label" id="ui_tpicker_second_label_' + dp_id + '"' +
					((o.showSecond) ? '' : noDisplay) + '>' + o.secondText + '</dt>'+
					'<dd class="ui_tpicker_second"><div id="ui_tpicker_second_' + dp_id + '"'+
							((o.showSecond) ? '' : noDisplay) + '></div>';

			if (o.showSecond && o.secondGrid > 0) {
				html += '<div style="padding-left: 1px"><table><tr>';

				for (var s = o.secondMin; s <= secMax; s += parseInt(o.secondGrid,10)) {
					secondGridSize++;
					html += '<td>' + ((s < 10) ? '0' : '') + s + '</td>';
				}

				html += '</tr></table></div>';
			}
			html += '</dd>';

			// Milliseconds
			html += '<dt class="ui_tpicker_millisec_label" id="ui_tpicker_millisec_label_' + dp_id + '"' +
					((o.showMillisec) ? '' : noDisplay) + '>' + o.millisecText + '</dt>'+
					'<dd class="ui_tpicker_millisec"><div id="ui_tpicker_millisec_' + dp_id + '"'+
							((o.showMillisec) ? '' : noDisplay) + '></div>';

			if (o.showMillisec && o.millisecGrid > 0) {
				html += '<div style="padding-left: 1px"><table><tr>';

				for (var l = o.millisecMin; l <= millisecMax; l += parseInt(o.millisecGrid,10)) {
					millisecGridSize++;
					html += '<td>' + ((l < 10) ? '0' : '') + l + '</td>';
				}

				html += '</tr></table></div>';
			}
			html += '</dd>';

			// Timezone
			html += '<dt class="ui_tpicker_timezone_label" id="ui_tpicker_timezone_label_' + dp_id + '"' +
					((o.showTimezone) ? '' : noDisplay) + '>' + o.timezoneText + '</dt>';
			html += '<dd class="ui_tpicker_timezone" id="ui_tpicker_timezone_' + dp_id + '"'	+
							((o.showTimezone) ? '' : noDisplay) + '></dd>';

			html += '</dl></div>';
			$tp = $(html);

				// if we only want time picker...
			if (o.timeOnly === true) {
				$tp.prepend(
					'<div class="ui-widget-header ui-helper-clearfix ui-corner-all">' +
						'<div class="ui-datepicker-title">' + o.timeOnlyTitle + '</div>' +
					'</div>');
				$dp.find('.ui-datepicker-header, .ui-datepicker-calendar').hide();
			}

			this.hour_slider = $tp.find('#ui_tpicker_hour_'+ dp_id).slider({
				orientation: "horizontal",
				value: this.hour,
				min: o.hourMin,
				max: hourMax,
				step: o.stepHour,
				slide: function(event, ui) {
					tp_inst.hour_slider.slider( "option", "value", ui.value);
					tp_inst._onTimeChange();
				}
			});

			
			// Updated by Peter Medeiros:
			// - Pass in Event and UI instance into slide function
			this.minute_slider = $tp.find('#ui_tpicker_minute_'+ dp_id).slider({
				orientation: "horizontal",
				value: this.minute,
				min: o.minuteMin,
				max: minMax,
				step: o.stepMinute,
				slide: function(event, ui) {
					tp_inst.minute_slider.slider( "option", "value", ui.value);
					tp_inst._onTimeChange();
				}
			});

			this.second_slider = $tp.find('#ui_tpicker_second_'+ dp_id).slider({
				orientation: "horizontal",
				value: this.second,
				min: o.secondMin,
				max: secMax,
				step: o.stepSecond,
				slide: function(event, ui) {
					tp_inst.second_slider.slider( "option", "value", ui.value);
					tp_inst._onTimeChange();
				}
			});

			this.millisec_slider = $tp.find('#ui_tpicker_millisec_'+ dp_id).slider({
				orientation: "horizontal",
				value: this.millisec,
				min: o.millisecMin,
				max: millisecMax,
				step: o.stepMillisec,
				slide: function(event, ui) {
					tp_inst.millisec_slider.slider( "option", "value", ui.value);
					tp_inst._onTimeChange();
				}
			});

			this.timezone_select = $tp.find('#ui_tpicker_timezone_'+ dp_id).append('<select></select>').find("select");
			$.fn.append.apply(this.timezone_select,
				$.map(o.timezoneList, function(val, idx) {
					return $("<option />")
						.val(typeof val == "object" ? val.value : val)
						.text(typeof val == "object" ? val.label : val);
				})
			);
			this.timezone_select.val((typeof this.timezone != "undefined" && this.timezone != null && this.timezone != "") ? this.timezone : o.timezone);
			this.timezone_select.change(function() {
				tp_inst._onTimeChange();
			});

			// Add grid functionality
			if (o.showHour && o.hourGrid > 0) {
				size = 100 * hourGridSize * o.hourGrid / (hourMax - o.hourMin);

				$tp.find(".ui_tpicker_hour table").css({
					width: size + "%",
					marginLeft: (size / (-2 * hourGridSize)) + "%",
					borderCollapse: 'collapse'
				}).find("td").each( function(index) {
					$(this).click(function() {
						var h = $(this).html();
						if(o.ampm)	{
							var ap = h.substring(2).toLowerCase(),
								aph = parseInt(h.substring(0,2), 10);
							if (ap == 'a') {
								if (aph == 12) h = 0;
								else h = aph;
							} else if (aph == 12) h = 12;
							else h = aph + 12;
						}
						tp_inst.hour_slider.slider("option", "value", h);
						tp_inst._onTimeChange();
						tp_inst._onSelectHandler();
					}).css({
						cursor: 'pointer',
						width: (100 / hourGridSize) + '%',
						textAlign: 'center',
						overflow: 'hidden'
					});
				});
			}

			if (o.showMinute && o.minuteGrid > 0) {
				size = 100 * minuteGridSize * o.minuteGrid / (minMax - o.minuteMin);
				$tp.find(".ui_tpicker_minute table").css({
					width: size + "%",
					marginLeft: (size / (-2 * minuteGridSize)) + "%",
					borderCollapse: 'collapse'
				}).find("td").each(function(index) {
					$(this).click(function() {
						tp_inst.minute_slider.slider("option", "value", $(this).html());
						tp_inst._onTimeChange();
						tp_inst._onSelectHandler();
					}).css({
						cursor: 'pointer',
						width: (100 / minuteGridSize) + '%',
						textAlign: 'center',
						overflow: 'hidden'
					});
				});
			}

			if (o.showSecond && o.secondGrid > 0) {
				$tp.find(".ui_tpicker_second table").css({
					width: size + "%",
					marginLeft: (size / (-2 * secondGridSize)) + "%",
					borderCollapse: 'collapse'
				}).find("td").each(function(index) {
					$(this).click(function() {
						tp_inst.second_slider.slider("option", "value", $(this).html());
						tp_inst._onTimeChange();
						tp_inst._onSelectHandler();
					}).css({
						cursor: 'pointer',
						width: (100 / secondGridSize) + '%',
						textAlign: 'center',
						overflow: 'hidden'
					});
				});
			}

			if (o.showMillisec && o.millisecGrid > 0) {
				$tp.find(".ui_tpicker_millisec table").css({
					width: size + "%",
					marginLeft: (size / (-2 * millisecGridSize)) + "%",
					borderCollapse: 'collapse'
				}).find("td").each(function(index) {
					$(this).click(function() {
						tp_inst.millisec_slider.slider("option", "value", $(this).html());
						tp_inst._onTimeChange();
						tp_inst._onSelectHandler();
					}).css({
						cursor: 'pointer',
						width: (100 / millisecGridSize) + '%',
						textAlign: 'center',
						overflow: 'hidden'
					});
				});
			}

			var $buttonPanel = $dp.find('.ui-datepicker-buttonpane');
			if ($buttonPanel.length) $buttonPanel.before($tp);
			else $dp.append($tp);

			this.$timeObj = $tp.find('#ui_tpicker_time_'+ dp_id);

			if (this.inst !== null) {
				var timeDefined = this.timeDefined;
				this._onTimeChange();
				this.timeDefined = timeDefined;
			}

			//Emulate datepicker onSelect behavior. Call on slidestop.
			var onSelectDelegate = function() {
				tp_inst._onSelectHandler();
			};
			this.hour_slider.bind('slidestop',onSelectDelegate);
			this.minute_slider.bind('slidestop',onSelectDelegate);
			this.second_slider.bind('slidestop',onSelectDelegate);
			this.millisec_slider.bind('slidestop',onSelectDelegate);
			
			// slideAccess integration: http://trentrichardson.com/2011/11/11/jquery-ui-sliders-and-touch-accessibility/
			if (this._defaults.addSliderAccess){
				var sliderAccessArgs = this._defaults.sliderAccessArgs;
				setTimeout(function(){ // fix for inline mode
					if($tp.find('.ui-slider-access').length == 0){
						$tp.find('.ui-slider:visible').sliderAccess(sliderAccessArgs);

						// fix any grids since sliders are shorter
						var sliderAccessWidth = $tp.find('.ui-slider-access:eq(0)').outerWidth(true);
						if(sliderAccessWidth){
							$tp.find('table:visible').each(function(){
								var $g = $(this),
									oldWidth = $g.outerWidth(),
									oldMarginLeft = $g.css('marginLeft').toString().replace('%',''),
									newWidth = oldWidth - sliderAccessWidth,
									newMarginLeft = ((oldMarginLeft * newWidth)/oldWidth) + '%';
						
								$g.css({ width: newWidth, marginLeft: newMarginLeft });
							});
						}
					}
				},0);
			}
			// end slideAccess integration
			
		}
	},

	//########################################################################
	// This function tries to limit the ability to go outside the
	// min/max date range
	//########################################################################
	_limitMinMaxDateTime: function(dp_inst, adjustSliders){
		var o = this._defaults,
			dp_date = new Date(dp_inst.selectedYear, dp_inst.selectedMonth, dp_inst.selectedDay);

		if(!this._defaults.showTimepicker) return; // No time so nothing to check here

		if($.datepicker._get(dp_inst, 'minDateTime') !== null && $.datepicker._get(dp_inst, 'minDateTime') !== undefined && dp_date){
			var minDateTime = $.datepicker._get(dp_inst, 'minDateTime'),
				minDateTimeDate = new Date(minDateTime.getFullYear(), minDateTime.getMonth(), minDateTime.getDate(), 0, 0, 0, 0);

			if(this.hourMinOriginal === null || this.minuteMinOriginal === null || this.secondMinOriginal === null || this.millisecMinOriginal === null){
				this.hourMinOriginal = o.hourMin;
				this.minuteMinOriginal = o.minuteMin;
				this.secondMinOriginal = o.secondMin;
				this.millisecMinOriginal = o.millisecMin;
			}

			if(dp_inst.settings.timeOnly || minDateTimeDate.getTime() == dp_date.getTime()) {
				this._defaults.hourMin = minDateTime.getHours();
				if (this.hour <= this._defaults.hourMin) {
					this.hour = this._defaults.hourMin;
					this._defaults.minuteMin = minDateTime.getMinutes();
					if (this.minute <= this._defaults.minuteMin) {
						this.minute = this._defaults.minuteMin;
						this._defaults.secondMin = minDateTime.getSeconds();
					} else if (this.second <= this._defaults.secondMin){
						this.second = this._defaults.secondMin;
						this._defaults.millisecMin = minDateTime.getMilliseconds();
					} else {
						if(this.millisec < this._defaults.millisecMin)
							this.millisec = this._defaults.millisecMin;
						this._defaults.millisecMin = this.millisecMinOriginal;
					}
				} else {
					this._defaults.minuteMin = this.minuteMinOriginal;
					this._defaults.secondMin = this.secondMinOriginal;
					this._defaults.millisecMin = this.millisecMinOriginal;
				}
			}else{
				this._defaults.hourMin = this.hourMinOriginal;
				this._defaults.minuteMin = this.minuteMinOriginal;
				this._defaults.secondMin = this.secondMinOriginal;
				this._defaults.millisecMin = this.millisecMinOriginal;
			}
		}

		if($.datepicker._get(dp_inst, 'maxDateTime') !== null && $.datepicker._get(dp_inst, 'maxDateTime') !== undefined && dp_date){
			var maxDateTime = $.datepicker._get(dp_inst, 'maxDateTime'),
				maxDateTimeDate = new Date(maxDateTime.getFullYear(), maxDateTime.getMonth(), maxDateTime.getDate(), 0, 0, 0, 0);

			if(this.hourMaxOriginal === null || this.minuteMaxOriginal === null || this.secondMaxOriginal === null){
				this.hourMaxOriginal = o.hourMax;
				this.minuteMaxOriginal = o.minuteMax;
				this.secondMaxOriginal = o.secondMax;
				this.millisecMaxOriginal = o.millisecMax;
			}

			if(dp_inst.settings.timeOnly || maxDateTimeDate.getTime() == dp_date.getTime()){
				this._defaults.hourMax = maxDateTime.getHours();
				if (this.hour >= this._defaults.hourMax) {
					this.hour = this._defaults.hourMax;
					this._defaults.minuteMax = maxDateTime.getMinutes();
					if (this.minute >= this._defaults.minuteMax) {
						this.minute = this._defaults.minuteMax;
						this._defaults.secondMax = maxDateTime.getSeconds();
					} else if (this.second >= this._defaults.secondMax) {
						this.second = this._defaults.secondMax;
						this._defaults.millisecMax = maxDateTime.getMilliseconds();
					} else {
						if(this.millisec > this._defaults.millisecMax) this.millisec = this._defaults.millisecMax;
						this._defaults.millisecMax = this.millisecMaxOriginal;
					}
				} else {
					this._defaults.minuteMax = this.minuteMaxOriginal;
					this._defaults.secondMax = this.secondMaxOriginal;
					this._defaults.millisecMax = this.millisecMaxOriginal;
				}
			}else{
				this._defaults.hourMax = this.hourMaxOriginal;
				this._defaults.minuteMax = this.minuteMaxOriginal;
				this._defaults.secondMax = this.secondMaxOriginal;
				this._defaults.millisecMax = this.millisecMaxOriginal;
			}
		}

		if(adjustSliders !== undefined && adjustSliders === true){
			var hourMax = parseInt((this._defaults.hourMax - ((this._defaults.hourMax - this._defaults.hourMin) % this._defaults.stepHour)) ,10),
                minMax  = parseInt((this._defaults.minuteMax - ((this._defaults.minuteMax - this._defaults.minuteMin) % this._defaults.stepMinute)) ,10),
                secMax  = parseInt((this._defaults.secondMax - ((this._defaults.secondMax - this._defaults.secondMin) % this._defaults.stepSecond)) ,10),
				millisecMax  = parseInt((this._defaults.millisecMax - ((this._defaults.millisecMax - this._defaults.millisecMin) % this._defaults.stepMillisec)) ,10);

			if(this.hour_slider)
				this.hour_slider.slider("option", { min: this._defaults.hourMin, max: hourMax }).slider('value', this.hour);
			if(this.minute_slider)
				this.minute_slider.slider("option", { min: this._defaults.minuteMin, max: minMax }).slider('value', this.minute);
			if(this.second_slider)
				this.second_slider.slider("option", { min: this._defaults.secondMin, max: secMax }).slider('value', this.second);
			if(this.millisec_slider)
				this.millisec_slider.slider("option", { min: this._defaults.millisecMin, max: millisecMax }).slider('value', this.millisec);
		}

	},

	
	//########################################################################
	// when a slider moves, set the internal time...
	// on time change is also called when the time is updated in the text field
	//########################################################################
	_onTimeChange: function() {
		var hour   = (this.hour_slider) ? this.hour_slider.slider('value') : false,
			minute = (this.minute_slider) ? this.minute_slider.slider('value') : false,
			second = (this.second_slider) ? this.second_slider.slider('value') : false,
			millisec = (this.millisec_slider) ? this.millisec_slider.slider('value') : false,
			timezone = (this.timezone_select) ? this.timezone_select.val() : false,
			o = this._defaults;

		if (typeof(hour) == 'object') hour = false;
		if (typeof(minute) == 'object') minute = false;
		if (typeof(second) == 'object') second = false;
		if (typeof(millisec) == 'object') millisec = false;
		if (typeof(timezone) == 'object') timezone = false;

		if (hour !== false) hour = parseInt(hour,10);
		if (minute !== false) minute = parseInt(minute,10);
		if (second !== false) second = parseInt(second,10);
		if (millisec !== false) millisec = parseInt(millisec,10);

		var ampm = o[hour < 12 ? 'amNames' : 'pmNames'][0];

		// If the update was done in the input field, the input field should not be updated.
		// If the update was done using the sliders, update the input field.
		var hasChanged = (hour != this.hour || minute != this.minute
				|| second != this.second || millisec != this.millisec
				|| (this.ampm.length > 0
				    && (hour < 12) != ($.inArray(this.ampm.toUpperCase(), this.amNames) !== -1))
				|| timezone != this.timezone);
		
		if (hasChanged) {

			if (hour !== false)this.hour = hour;
			if (minute !== false) this.minute = minute;
			if (second !== false) this.second = second;
			if (millisec !== false) this.millisec = millisec;
			if (timezone !== false) this.timezone = timezone;
			
			if (!this.inst) this.inst = $.datepicker._getInst(this.$input[0]);
			
			this._limitMinMaxDateTime(this.inst, true);
		}
		if (o.ampm) this.ampm = ampm;
		
		//this._formatTime();
		this.formattedTime = $.datepicker.formatTime(this._defaults.timeFormat, this, this._defaults);
		if (this.$timeObj) this.$timeObj.text(this.formattedTime + o.timeSuffix);
		this.timeDefined = true;
		if (hasChanged) this._updateDateTime();
	},
    
	//########################################################################
	// call custom onSelect. 
	// bind to sliders slidestop, and grid click.
	//########################################################################
	_onSelectHandler: function() {
		var onSelect = this._defaults.onSelect;
		var inputEl = this.$input ? this.$input[0] : null;
		if (onSelect && inputEl) {
			onSelect.apply(inputEl, [this.formattedDateTime, this]);
		}
	},

	//########################################################################
	// left for any backwards compatibility
	//########################################################################
	_formatTime: function(time, format) {
		time = time || { hour: this.hour, minute: this.minute, second: this.second, millisec: this.millisec, ampm: this.ampm, timezone: this.timezone };
		var tmptime = (format || this._defaults.timeFormat).toString();

		tmptime = $.datepicker.formatTime(tmptime, time, this._defaults);
		
		if (arguments.length) return tmptime;
		else this.formattedTime = tmptime;
	},

	//########################################################################
	// update our input with the new date time..
	//########################################################################
	_updateDateTime: function(dp_inst) {
		dp_inst = this.inst || dp_inst;
		var dt = $.datepicker._daylightSavingAdjust(new Date(dp_inst.selectedYear, dp_inst.selectedMonth, dp_inst.selectedDay)),
			dateFmt = $.datepicker._get(dp_inst, 'dateFormat'),
			formatCfg = $.datepicker._getFormatConfig(dp_inst),
			timeAvailable = dt !== null && this.timeDefined;
		this.formattedDate = $.datepicker.formatDate(dateFmt, (dt === null ? new Date() : dt), formatCfg);
		var formattedDateTime = this.formattedDate;
		if (dp_inst.lastVal !== undefined && (dp_inst.lastVal.length > 0 && this.$input.val().length === 0))
			return;

		if (this._defaults.timeOnly === true) {
			formattedDateTime = this.formattedTime;
		} else if (this._defaults.timeOnly !== true && (this._defaults.alwaysSetTime || timeAvailable)) {
			formattedDateTime += this._defaults.separator + this.formattedTime + this._defaults.timeSuffix;
		}

		this.formattedDateTime = formattedDateTime;

		if(!this._defaults.showTimepicker) {
			this.$input.val(this.formattedDate);
		} else if (this.$altInput && this._defaults.altFieldTimeOnly === true) {
			this.$altInput.val(this.formattedTime);
			this.$input.val(this.formattedDate);
		} else if(this.$altInput) {
			this.$altInput.val(formattedDateTime);
			this.$input.val(formattedDateTime);
		} else {
			this.$input.val(formattedDateTime);
		}
		
		this.$input.trigger("change");
	}

});

$.fn.extend({
	//########################################################################
	// shorthand just to use timepicker..
	//########################################################################
	timepicker: function(o) {
		o = o || {};
		var tmp_args = arguments;

		if (typeof o == 'object') tmp_args[0] = $.extend(o, { timeOnly: true });

		return $(this).each(function() {
			$.fn.datetimepicker.apply($(this), tmp_args);
		});
	},

	//########################################################################
	// extend timepicker to datepicker
	//########################################################################
	datetimepicker: function(o) {
		o = o || {};
		var $input = this,
		tmp_args = arguments;

		if (typeof(o) == 'string'){
			if(o == 'getDate') 
				return $.fn.datepicker.apply($(this[0]), tmp_args);
			else 
				return this.each(function() {
					var $t = $(this);
					$t.datepicker.apply($t, tmp_args);
				});
		}
		else
			return this.each(function() {
				var $t = $(this);
				$t.datepicker($.timepicker._newInst($t, o)._defaults);
			});
	}
});

//########################################################################
// format the time all pretty... 
// format = string format of the time
// time = a {}, not a Date() for timezones
// options = essentially the regional[].. amNames, pmNames, ampm
//########################################################################
$.datepicker.formatTime = function(format, time, options) {
	options = options || {};
	options = $.extend($.timepicker._defaults, options);
	time = $.extend({hour:0, minute:0, second:0, millisec:0, timezone:'+0000'}, time);
	
	var tmptime = format;
	var ampmName = options['amNames'][0];

	var hour = parseInt(time.hour, 10);
	if (options.ampm) {
		if (hour > 11){
			ampmName = options['pmNames'][0];
			if(hour > 12)
				hour = hour % 12;
		}
		if (hour === 0)
			hour = 12;
	}
	tmptime = tmptime.replace(/(?:hh?|mm?|ss?|[tT]{1,2}|[lz])/g, function(match) {
		switch (match.toLowerCase()) {
			case 'hh': return ('0' + hour).slice(-2);
			case 'h':  return hour;
			case 'mm': return ('0' + time.minute).slice(-2);
			case 'm':  return time.minute;
			case 'ss': return ('0' + time.second).slice(-2);
			case 's':  return time.second;
			case 'l':  return ('00' + time.millisec).slice(-3);
			case 'z':  return time.timezone;
			case 't': case 'tt':
				if (options.ampm) {
					if (match.length == 1)
						ampmName = ampmName.charAt(0);
					return match.charAt(0) == 'T' ? ampmName.toUpperCase() : ampmName.toLowerCase();
				}
				return '';
		}
	});

	tmptime = $.trim(tmptime);
	return tmptime;
}

//########################################################################
// the bad hack :/ override datepicker so it doesnt close on select
// inspired: http://stackoverflow.com/questions/1252512/jquery-datepicker-prevent-closing-picker-when-clicking-a-date/1762378#1762378
//########################################################################
$.datepicker._base_selectDate = $.datepicker._selectDate;
$.datepicker._selectDate = function (id, dateStr) {
	var inst = this._getInst($(id)[0]),
		tp_inst = this._get(inst, 'timepicker');

	if (tp_inst) {
		tp_inst._limitMinMaxDateTime(inst, true);
		inst.inline = inst.stay_open = true;
		//This way the onSelect handler called from calendarpicker get the full dateTime
		this._base_selectDate(id, dateStr);
		inst.inline = inst.stay_open = false;
		this._notifyChange(inst);
		this._updateDatepicker(inst);
	}
	else this._base_selectDate(id, dateStr);
};

//#############################################################################################
// second bad hack :/ override datepicker so it triggers an event when changing the input field
// and does not redraw the datepicker on every selectDate event
//#############################################################################################
$.datepicker._base_updateDatepicker = $.datepicker._updateDatepicker;
$.datepicker._updateDatepicker = function(inst) {

	// don't popup the datepicker if there is another instance already opened
	var input = inst.input[0];
	if($.datepicker._curInst &&
	   $.datepicker._curInst != inst &&
	   $.datepicker._datepickerShowing &&
	   $.datepicker._lastInput != input) {
		return;
	}

	if (typeof(inst.stay_open) !== 'boolean' || inst.stay_open === false) {
				
		this._base_updateDatepicker(inst);
		
		// Reload the time control when changing something in the input text field.
		var tp_inst = this._get(inst, 'timepicker');
		if(tp_inst) tp_inst._addTimePicker(inst);
	}
};

//#######################################################################################
// third bad hack :/ override datepicker so it allows spaces and colon in the input field
//#######################################################################################
$.datepicker._base_doKeyPress = $.datepicker._doKeyPress;
$.datepicker._doKeyPress = function(event) {
	var inst = $.datepicker._getInst(event.target),
		tp_inst = $.datepicker._get(inst, 'timepicker');

	if (tp_inst) {
		if ($.datepicker._get(inst, 'constrainInput')) {
			var ampm = tp_inst._defaults.ampm,
				dateChars = $.datepicker._possibleChars($.datepicker._get(inst, 'dateFormat')),
				datetimeChars = tp_inst._defaults.timeFormat.toString()
								.replace(/[hms]/g, '')
								.replace(/TT/g, ampm ? 'APM' : '')
								.replace(/Tt/g, ampm ? 'AaPpMm' : '')
								.replace(/tT/g, ampm ? 'AaPpMm' : '')
								.replace(/T/g, ampm ? 'AP' : '')
								.replace(/tt/g, ampm ? 'apm' : '')
								.replace(/t/g, ampm ? 'ap' : '') +
								" " +
								tp_inst._defaults.separator +
								tp_inst._defaults.timeSuffix +
								(tp_inst._defaults.showTimezone ? tp_inst._defaults.timezoneList.join('') : '') +
								(tp_inst._defaults.amNames.join('')) +
								(tp_inst._defaults.pmNames.join('')) +
								dateChars,
				chr = String.fromCharCode(event.charCode === undefined ? event.keyCode : event.charCode);
			return event.ctrlKey || (chr < ' ' || !dateChars || datetimeChars.indexOf(chr) > -1);
		}
	}
	
	return $.datepicker._base_doKeyPress(event);
};

//#######################################################################################
// Override key up event to sync manual input changes.
//#######################################################################################
$.datepicker._base_doKeyUp = $.datepicker._doKeyUp;
$.datepicker._doKeyUp = function (event) {
	var inst = $.datepicker._getInst(event.target),
		tp_inst = $.datepicker._get(inst, 'timepicker');

	if (tp_inst) {
		if (tp_inst._defaults.timeOnly && (inst.input.val() != inst.lastVal)) {
			try {
				$.datepicker._updateDatepicker(inst);
			}
			catch (err) {
				$.datepicker.log(err);
			}
		}
	}

	return $.datepicker._base_doKeyUp(event);
};

//#######################################################################################
// override "Today" button to also grab the time.
//#######################################################################################
$.datepicker._base_gotoToday = $.datepicker._gotoToday;
$.datepicker._gotoToday = function(id) {
	var inst = this._getInst($(id)[0]),
		$dp = inst.dpDiv;
	this._base_gotoToday(id);
	var now = new Date();
	var tp_inst = this._get(inst, 'timepicker');
	if (tp_inst && tp_inst._defaults.showTimezone && tp_inst.timezone_select) {
		var tzoffset = now.getTimezoneOffset(); // If +0100, returns -60
		var tzsign = tzoffset > 0 ? '-' : '+';
		tzoffset = Math.abs(tzoffset);
		var tzmin = tzoffset % 60;
		tzoffset = tzsign + ('0' + (tzoffset - tzmin) / 60).slice(-2) + ('0' + tzmin).slice(-2);
		if (tp_inst._defaults.timezoneIso8609)
			tzoffset = tzoffset.substring(0, 3) + ':' + tzoffset.substring(3);
		tp_inst.timezone_select.val(tzoffset);
	}
	this._setTime(inst, now);
	$( '.ui-datepicker-today', $dp).click(); 
};

//#######################################################################################
// Disable & enable the Time in the datetimepicker
//#######################################################################################
$.datepicker._disableTimepickerDatepicker = function(target, date, withDate) {
	var inst = this._getInst(target),
	tp_inst = this._get(inst, 'timepicker');
	$(target).datepicker('getDate'); // Init selected[Year|Month|Day]
	if (tp_inst) {
		tp_inst._defaults.showTimepicker = false;
		tp_inst._updateDateTime(inst);
	}
};

$.datepicker._enableTimepickerDatepicker = function(target, date, withDate) {
	var inst = this._getInst(target),
	tp_inst = this._get(inst, 'timepicker');
	$(target).datepicker('getDate'); // Init selected[Year|Month|Day]
	if (tp_inst) {
		tp_inst._defaults.showTimepicker = true;
		tp_inst._addTimePicker(inst); // Could be disabled on page load
		tp_inst._updateDateTime(inst);
	}
};

//#######################################################################################
// Create our own set time function
//#######################################################################################
$.datepicker._setTime = function(inst, date) {
	var tp_inst = this._get(inst, 'timepicker');
	if (tp_inst) {
		var defaults = tp_inst._defaults,
			// calling _setTime with no date sets time to defaults
			hour = date ? date.getHours() : defaults.hour,
			minute = date ? date.getMinutes() : defaults.minute,
			second = date ? date.getSeconds() : defaults.second,
			millisec = date ? date.getMilliseconds() : defaults.millisec;

		//check if within min/max times..
		if ((hour < defaults.hourMin || hour > defaults.hourMax) || (minute < defaults.minuteMin || minute > defaults.minuteMax) || (second < defaults.secondMin || second > defaults.secondMax) || (millisec < defaults.millisecMin || millisec > defaults.millisecMax)) {
			hour = defaults.hourMin;
			minute = defaults.minuteMin;
			second = defaults.secondMin;
			millisec = defaults.millisecMin;
		}

		tp_inst.hour = hour;
		tp_inst.minute = minute;
		tp_inst.second = second;
		tp_inst.millisec = millisec;

		if (tp_inst.hour_slider) tp_inst.hour_slider.slider('value', hour);
		if (tp_inst.minute_slider) tp_inst.minute_slider.slider('value', minute);
		if (tp_inst.second_slider) tp_inst.second_slider.slider('value', second);
		if (tp_inst.millisec_slider) tp_inst.millisec_slider.slider('value', millisec);

		tp_inst._onTimeChange();
		tp_inst._updateDateTime(inst);
	}
};

//#######################################################################################
// Create new public method to set only time, callable as $().datepicker('setTime', date)
//#######################################################################################
$.datepicker._setTimeDatepicker = function(target, date, withDate) {
	var inst = this._getInst(target),
		tp_inst = this._get(inst, 'timepicker');

	if (tp_inst) {
		this._setDateFromField(inst);
		var tp_date;
		if (date) {
			if (typeof date == "string") {
				tp_inst._parseTime(date, withDate);
				tp_date = new Date();
				tp_date.setHours(tp_inst.hour, tp_inst.minute, tp_inst.second, tp_inst.millisec);
			}
			else tp_date = new Date(date.getTime());
			if (tp_date.toString() == 'Invalid Date') tp_date = undefined;
			this._setTime(inst, tp_date);
		}
	}

};

//#######################################################################################
// override setDate() to allow setting time too within Date object
//#######################################################################################
$.datepicker._base_setDateDatepicker = $.datepicker._setDateDatepicker;
$.datepicker._setDateDatepicker = function(target, date) {
	var inst = this._getInst(target),
	tp_date = (date instanceof Date) ? new Date(date.getTime()) : date;

	this._updateDatepicker(inst);
	this._base_setDateDatepicker.apply(this, arguments);
	this._setTimeDatepicker(target, tp_date, true);
};

//#######################################################################################
// override getDate() to allow getting time too within Date object
//#######################################################################################
$.datepicker._base_getDateDatepicker = $.datepicker._getDateDatepicker;
$.datepicker._getDateDatepicker = function(target, noDefault) {
	var inst = this._getInst(target),
		tp_inst = this._get(inst, 'timepicker');

	if (tp_inst) {
		this._setDateFromField(inst, noDefault);
		var date = this._getDate(inst);
		if (date && tp_inst._parseTime($(target).val(), tp_inst.timeOnly)) date.setHours(tp_inst.hour, tp_inst.minute, tp_inst.second, tp_inst.millisec);
		return date;
	}
	return this._base_getDateDatepicker(target, noDefault);
};

//#######################################################################################
// override parseDate() because UI 1.8.14 throws an error about "Extra characters"
// An option in datapicker to ignore extra format characters would be nicer.
//#######################################################################################
$.datepicker._base_parseDate = $.datepicker.parseDate;
$.datepicker.parseDate = function(format, value, settings) {
	var date;
	try {
		date = this._base_parseDate(format, value, settings);
	} catch (err) {
		if (err.indexOf(":") >= 0) {
			// Hack!  The error message ends with a colon, a space, and
			// the "extra" characters.  We rely on that instead of
			// attempting to perfectly reproduce the parsing algorithm.
			date = this._base_parseDate(format, value.substring(0,value.length-(err.length-err.indexOf(':')-2)), settings);
		} else {
			// The underlying error was not related to the time
			throw err;
		}
	}
	return date;
};

//#######################################################################################
// override formatDate to set date with time to the input
//#######################################################################################
$.datepicker._base_formatDate=$.datepicker._formatDate;
$.datepicker._formatDate = function(inst, day, month, year){
	var tp_inst = this._get(inst, 'timepicker');
	if(tp_inst)
	{
		if(day)
			var b = this._base_formatDate(inst, day, month, year);
		tp_inst._updateDateTime(inst);	
		return tp_inst.$input.val();
	}
	return this._base_formatDate(inst);
};

//#######################################################################################
// override options setter to add time to maxDate(Time) and minDate(Time). MaxDate
//#######################################################################################
$.datepicker._base_optionDatepicker = $.datepicker._optionDatepicker;
$.datepicker._optionDatepicker = function(target, name, value) {
	var inst = this._getInst(target),
		tp_inst = this._get(inst, 'timepicker');
	if (tp_inst) {
		var min,max,onselect;
		if (typeof name == 'string') { // if min/max was set with the string
			if (name==='minDate' || name==='minDateTime' )
				min = value;
			else if (name==='maxDate' || name==='maxDateTime')
				max = value;
			else if (name==='onSelect')
				onselect=value;
		} else if (typeof name == 'object') { //if min/max was set with the JSON
			if(name.minDate)
				min = name.minDate;
			else if (name.minDateTime)
				min = name.minDateTime;
			else if (name.maxDate)
				max = name.maxDate;
			else if (name.maxDateTime)
				max = name.maxDateTime;
		}
		if(min){ //if min was set
			if(min==0)
				min=new Date();
			else
				min= new Date(min);
			
			tp_inst._defaults.minDate = min;
			tp_inst._defaults.minDateTime = min;
		} else if (max){ //if max was set
			if(max==0)
				max=new Date();
			else
				max= new Date(max);
			tp_inst._defaults.maxDate = max;
			tp_inst._defaults.maxDateTime = max;
		}
		else if (onselect)
			tp_inst._defaults.onSelect=onselect;
	}
	if (value === undefined)
		return this._base_optionDatepicker(target, name);
	return this._base_optionDatepicker(target, name, value);
};

//#######################################################################################
// jQuery extend now ignores nulls!
//#######################################################################################
function extendRemove(target, props) {
	$.extend(target, props);
	for (var name in props)
		if (props[name] === null || props[name] === undefined)
			target[name] = props[name];
	return target;
};

$.timepicker = new Timepicker(); // singleton instance
$.timepicker.version = "0.9.9";

})(jQuery);


/************************ Datetimepicker addon end *****************************************/



//-------------- pt-br

/* Brazilian initialisation for the jQuery UI date picker plugin. */
/* Written by Leonildo Costa Silva (leocsilva@gmail.com). */
jQuery(function($){
	$.datepicker.regional['pt-BR'] = {
		closeText: 'Fechar',
		prevText: 'Anterior',
		nextText: 'Pr&oacute;ximo',
		currentText: 'Hoje',
		monthNames: ['Janeiro','Fevereiro','Mar&ccedil;o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun',
		'Jul','Ago','Set','Out','Nov','Dez'],
		dayNames: ['Domingo','Segunda-feira','Ter&ccedil;a-feira','Quarta-feira','Quinta-feira','Sexta-feira','Sabado'],
		dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
		dayNamesMin: ['Dom','Seg','Ter','Qua','Qui','Sex','Sab'],
		weekHeader: 'W',
		dateFormat: 'dd/mm/yy',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''};
	$.datepicker.setDefaults($.datepicker.regional['pt-BR']);
	
	
	$.timepicker.regional['pt-BR'] = { // Default regional settings
			currentText: 'Agora',
			closeText: 'Ok',
			ampm: false,
			amNames: ['AM', 'A'],
			pmNames: ['PM', 'P'],
			timeFormat: 'hh:mm tt',
			timeSuffix: '',
			timeOnlyTitle: 'Escolha a hora',
			timeText: 'Tempo',
			hourText: 'Hora',
			minuteText: 'Minuto',
			secondText: 'Segundo',
			millisecText: 'Milisegundo',
			timezoneText: 'Time Zone'
		};
	
	$.timepicker.setDefaults($.timepicker.regional['pt-BR']);
});

//-------------- End Jquery plugins --------------------------------------

Cnec = {};
Cnec.extend = function(from, to) {
	var z= function(){}
	z.prototype = from.prototype;
	for(var i in z.prototype)
	{
		if(to.prototype[i]==null)to.prototype[i] = z.prototype[i];
	}
	to.prototype.superClass = from;
	to.superClass = from;
};
Cnec.bind = function(fn, obj){return function(){fn.apply(obj, arguments)};}
Cnec.bindfn = function(fn, obj){return function(){ return fn.apply(obj, arguments)};}
Cnec.bindComponents = function()
{
	var elements = arguments[0] == null ? document.getElementsByTagName("*") : arguments[0].getElementsByTagName("*");
	var i;
	for(i = 0; i<elements.length; i++)
	{
		try{
			if((!elements[i].attributes) || (!elements[i].attributes.cnec)) continue;
			var element = elements[i];	
			eval('var args =' + elements[i].attributes.cnec.nodeValue.replace(/&apos;/g,'\'')+';');
			if(!args) continue;
			var comp;
			for(comp = 0; comp < args.length; comp++)
				new args[comp].code(elements[i], args[comp]);
		}
		catch(ex){console.log(ex);}
	}
}
Cnec.pageRect = function()
{
	return {'x':document.documentElement.offsetWidth, 'y': Math.max(document.documentElement.scrollHeight, document.documentElement.offsetHeight - document.documentElement.scrollTop)};
}
Cnec.viewPort = function()
{
	var x =  self.pageXOffset ? self.pageXOffset : document.documentElement.scrollLeft;	
	var width = self.innerWidth ? self.innerWidth : document.documentElement.clientWidth;
	var y = self.pageYOffset ? self.pageYOffset : document.documentElement.scrollTop;
	var height = self.innerHeight ? self.innerHeight : document.documentElement.clientHeight;
	return {'x':x, 'y':y, 'width':width, 'height':height};
}
Cnec.getRect = function(e)
{
	var width = e.offsetWidth;
	var height = e.offsetHeight;
	
	var left = 0;
	var top = 0;
	
	if (e.offsetParent)
	{
		left = e.offsetLeft
		top = e.offsetTop
		
		while (e = e.offsetParent) 
		{
			left += e.offsetLeft;
			top += e.offsetTop;
		}
	}
	
	return {"x": left, "y": top, 'width':width, 'height':height}
}

Cnec.posAt = function(obj) 
{
  var pos = arguments[1] ? arguments[1] : 'cm';
	var rect = arguments[2] ? this.getRect(arguments[2]) : Cnec.viewPort();
	var off = arguments[3] ? arguments[3] : {x:0,y:0};
	var orect = Cnec.getRect(obj);
	
	obj.style.position = 'absolute';
	var x = rect.x;
	var y = rect.y;
  //calc x
  if(pos.match(/c/)){x += Math.round((rect.width - orect.width) /2);}
  else if(pos.match(/r/)) {x += rect.width-2;}
  //calc y
  if(pos.match(/m/)){y += Math.round((rect.height - orect.height) /2);}
  else if(pos.match(/b/)) {y += rect.height;} 
  else if(pos.match(/t/)) {y -= rect.height;} 
	obj.style.top = y+off.y + "px";
	obj.style.left = x+off.x + "px";
}


Cnec.darken = function ()
{
	var div = document.createElement('div');
	var d = Cnec.pageRect();
	var d2 = Cnec.viewPort();
	//alert(d.width);
	div.style.top = '0';
	div.style.left = '0';
	div.style.width = d.x + "px";
	div.style.height = Math.max(d.y, d2.height) + "px";
	div.style.backgroundColor = arguments[0] ? arguments[0] : "black";
	div.style.position = 'absolute';
	$(div).css('opacity', .8);
	document.body.appendChild(div);
	return div;
}

Cnec.Animate = function(args)
{
	this.duration = args.duration;
	this.start = new Date().getTime();
	this.callback = args.callback;
	this.ref = Cnec.bind(this.go, this);
	setTimeout(this.ref,33);
	this.backwards = false;
	
}
Cnec.Animate.prototype = {
'go':function()
{
	this.current = new Date().getTime();
	var cur = this.current - this.start;
	this.callback(cur/this.duration);
	if(cur > this.duration) {return;}
	setTimeout(this.ref,33); 
}
}

function CnecGallery(element, args)
{
	this.imgClickRef = Cnec.bindfn(this.showImage, this);
	this.keyDownRef = Cnec.bindfn(this.keyDown, this);
	this.clickRef = Cnec.bindfn(this.click, this);
	this.images = $(element).find('.thumbImage img');
	for(var i = 0; i<this.images.length; i++)
	{
		$(this.images[i]).bind('click', {index:i}, this.imgClickRef);
	}
	this.current = -1;
	this.window = false;
	$(document).bind('keydown', this.keyDownRef);
}


CnecGallery.prototype.showImage = function(e)
{
	this.current = e.data.index;
	
	
	var src = e.currentTarget.src.replace(/-thumb.jpg/, '.jpg');
	var title = e.currentTarget.parentNode.parentNode.title;
	if(this.window)
	{
		$(this.window).find(".the-image")[0].src = src;
		$(this.window).find("p")[0].innerHTML = title;
		return;
	}
	this.bg = Cnec.darken();
	
	this.window = $("<div id='ImageViewer'><a title='próxima (seta direita)' class='next'></a><a title='anterior (seta esquerda)' class='previous'></a><img class='the-image' src='" + src + "' onload='Cnec.posAt(this.parentNode)'  /><a class='close' title='fechar (pressione Esc)'>X</a><p>" + title + "</p></div>").appendTo(document.body)[0];
	this.bg.style.zIndex = 4;
	this.window.style.zIndex = 5;
	this.createPhotoScroller();
	
	$(this.window).click(this.clickRef); 
	$(this.bg).dblclick(Cnec.bindfn(this.close, this));
	Cnec.posAt(this.window);
	this.open = true;
	this.setSelected();
	if(e && e.preventDefault) e.preventDefault();
}

CnecGallery.prototype.createPhotoScroller = function()
{
	var html = "<div class='photoScroll'><a class='next'></a><a class='previous'></a><div class='items'>";
	for(var i = 0; i<this.images.length; i++)
	{
		html +=  "<img class='img imgIndex" + i+ "' src='" + this.images[i].src + "' />"; 
	}
	
	var scroller = $(html + "</div></div>").appendTo(this.window);
	this.hscroller = new HScroller(scroller[0], {inc:589, 'speed':500 });
	
}

CnecGallery.prototype.keyDown = function(e)
{
	if(!this.window) return;
	if(e.keyCode == 27) return this.close();
	if(e.keyCode == 37)	return this.prev();
	if(e.keyCode == 39)	return this.next();
}

CnecGallery.prototype.click = function(e)
{
	if(e.target.className.match(/imgIndex(\d+)/))
	{
		var index = parseInt(RegExp.$1);
		this.current = index - 1;
		this.next();
		return;
	}
	
	if((e.target.parentNode == this.window) && $(e.target).hasClass('next')) return this.next();
	if((e.target.parentNode == this.window) && $(e.target).hasClass('previous')) return this.prev();
	if($(e.target).hasClass('close')) return this.close();
}

CnecGallery.prototype.close = function()
{
	$(this.bg).remove();
	$(this.window).remove();
	this.window = null;
	this.open = false;
}

CnecGallery.prototype.prev = function()
{
	var index = this.current - 1;
	if(index<0) return;
	this.showImage({'currentTarget' : this.images[index], 'data':{'index':index}});
	this.setSelected();
}

CnecGallery.prototype.next = function()
{
	index = this.current + 1;
	if(index>this.images.length-1) return;
	this.showImage({'currentTarget' : this.images[index], 'data':{'index':index}});
	this.setSelected();
}

CnecGallery.prototype.setSelected = function()
{
	var selected = $(this.window).find('.selected');
	selected.removeClass('selected');
	selected = $(this.window).find('.imgIndex' + this.current);
	selected.addClass('selected');
	var items = selected[0].parentNode;
	var inc = items.scrollLeft - selected[0].offsetLeft;
	var start = items.scrollLeft;
	var ex = this.hscroller;
	if(inc<0)
	{
		inc *= -1;
		new Cnec.Animate({'duration':500, 'callback': function(e){items.scrollLeft = start + Math.min(inc,inc*e) ; ex.adjust();} });
		return;
	}
	new Cnec.Animate({'duration':500, 'callback': function(e){items.scrollLeft = start - Math.min(inc,inc*e) ; ex.adjust();} });
}

//cookies

Cnec.Cookies = {};
Cnec.Cookies.read = function()
{
	var s = document.cookie;
	for(var i in Cnec.Cookies)
	{
		if(i.match(/^(read|write|remove)$/)) continue;
		Cnec.Cookies[i] = null;
	}
	s.replace(/(\w+?)=(.*?)(; |$)/g, function(a, b, c)
	{
		if(!c) return;
		Cnec.Cookies[b] = unescape(c); 
		
	});
}

Cnec.Cookies.write  = function(cookie, value)
{
	Cnec.Cookies[cookie] = value;
	var expires = "";
	if(arguments[2])
	{
		var now = new Date();
		now.setSeconds(arguments[2]);
		expires = ";expires=" + now.toGMTString();
	}
	document.cookie = cookie + "=" + escape(value) + expires + ";path=/";
}
Cnec.Cookies.remove  = function(cookie)
{
	var date = new Date();
	date.setTime(date.getTime()-50);
	document.cookie= cookie+"=; expires="+ date.toGMTString();
	Cnec.Cookies.read();
}
Cnec.Cookies.read();

//hscroller

HScroller = function (element, args)
{
	this.element = element; 
	this.inc = args.inc;
	this.speed = args.speed ? args.speed : 1000;
	var controls = $(element).find('.items,.previous,.next');
	this[controls[0].className] = controls[0];
	this[controls[1].className] = controls[1];
	this[controls[2].className] = controls[2];
	$(element).click(Cnec.bind(this.click, this));
	this.adjust();
}

HScroller.prototype.click = function(e)
{
	
	var x = e.target;
	var items = this.items;
	var start = items.scrollLeft;
	var inc = this.inc;
	var ex = this;
	if(x.className=='next') new Cnec.Animate({'duration':this.speed, 'callback': function(e){items.scrollLeft = start + Math.min(inc,inc*e) ; ex.adjust();} });
	if(x.className=='previous') new Cnec.Animate({'duration':this.speed, 'callback': function(e){items.scrollLeft = start - Math.min(inc,inc*e) ; ex.adjust();}});
	return false;
	
}
HScroller.prototype.adjust = function()
{
	if(this.items.scrollLeft < 1) $(this.previous).addClass('disabled');
	else $(this.previous).removeClass('disabled');;
	if((this.items.scrollWidth - this.items.scrollLeft) <= this.inc+6) $(this.next).addClass('disabled');
	else $(this.next).removeClass('disabled');
}

Scroller = function (element, args)
{
	this.element = element; 
	this.inc = args.inc;
	this.speed = args.speed ? args.speed : 1000;
	var controls = $(element).find('.items,.previous,.next');
	this[controls[0].className] = controls[0];
	this[controls[1].className] = controls[1];
	this[controls[2].className] = controls[2];
	$(element).click(Cnec.bind(this.click, this));
	this.adjust();
}

Scroller.prototype.click = function(e)
{
	
	var x = e.target;
	var items = this.items;
	var start = items.scrollTop;
	var inc = this.inc;
	var ex = this;
	if(x.className=='next') return new Cnec.Animate({'duration':this.speed, 'callback': function(e){items.scrollTop = start + Math.min(inc,inc*e) ; ex.adjust();} });
	if(x.className=='previous') return new Cnec.Animate({'duration':this.speed, 'callback': function(e){items.scrollTop = start - Math.min(inc,inc*e) ; ex.adjust();}});
	
}
Scroller.prototype.adjust = function()
{
	if(this.items.scrollTop<1) $(this.previous).addClass('disabled');
	else $(this.previous).removeClass('disabled');
	if((this.items.scrollHeight - this.items.scrollTop) <= this.inc+6) $(this.next).addClass('disabled');
	else  $(this.next).removeClass('disabled');
	
}


Date.prototype.year = function(){return parseInt(this.getYear())+ (navigator.userAgent.match(/gecko|Opera/i) ? 1900 : 0);}
function Calendar(element, args)
{
	var d = new Date();
	if(args.date)
	{
		args.date.match(/(\d+)-(\d+)-(\d+)/)
		d = new Date(RegExp.$1, parseInt(RegExp.$2.replace(/^0/,''))-1 , 1);
	}
	var months = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"];
	var month = months[parseInt(d.getMonth())];
	
	d.setDate(1);
	var skip = d.getDay();
	s = ""; 
	if(args.next && args.next.length>0) s += "<a class='next' href='" +  args.next +"'></a>";
	if(args.previous && args.previous.length>0) s+= "<a class='previous' href='" +  args.previous +"'></a>";
	s = "<table><caption>" + s + month + " - " + d.year() +"<caption><tr><th>d</th><th>s</th><th>t</th><th>q</th><th>q</th><th>s</th><th>s</th></tr><tr>";
	
	for(i=0;i<skip;i++)s+="<td class='skip'></td>";
	
	d.setMonth(d.getMonth()+1);
	d.setDate(-1);
	max = d.getDate()+1;
	count = skip;
	for(i=1;i<=max;i++)
	{
		var comment = args.comments && args.comments[i] ? ' title="' + args.comments[i] + '"': ""; 
		var classes = args.classes && args.classes[i] ? ' class="' + args.classes[i] + '"' : "";
		var href = args.hrefs && args.hrefs[i] ? ' onclick="location = \'' + args.hrefs[i] + '\'">' : ">";
		
		s += "<td" + comment + classes + href + i +"</td>";
		if((++count) == 7){count = 0; s+="</tr><tr>";}
	}
	skip = 7 - count;
	for(i=0;i<skip;i++) s+="<td class='skip'></td>";
	element.innerHTML = s + "</tr></table>";
};

Cnec.Hover  = function(element, args)
{
	if(!args.hoverClass) args.hoverClass = 'hover'; 
	if(args.buttonMode)	$(element).click(function(){
		if(args.target == 'blank')
		{
			window.open($(this).find("a")[0].href);
			return false;
		}
		else	
			location = $(this).find("a")[0].href;}
	);
	$(element).hover(function (e) { $(this).addClass(args.hoverClass);}, function (e) { $(this).removeClass(args.hoverClass);});
};

Cnec.Focus  = function(element, args)
{
	var focusClass  = !args.focusClass ? 'focus' : args.focusClass;
	var focusElement = !args.focusElement ? element : args.focusElement;
	$(element).focus(function (e) { $(focusElement).addClass(focusClass);});
	$(element).blur( function (e) { $(focusElement).removeClass(focusClass);});
}

Cnec.FullHeight  = function(element, args)
{
	var h1 = $("html").height();
	var h2 = Cnec.viewPort().height; 
	if(h1 < h2)
	{
		var addSize = h2 - h1;
		var height = $(element).height();
		$(element).height(height + addSize);
	}
}

Cnec.PlaceHolder = function(element, args) 
{
	try{
		if("placeholder" in element) {
			element.placeholder = args.hint;
			return;
		}
	}
	catch(e){
		return;
	}
	this.element = element;
	this.hint = args.hint;
	this.isPassword = element.type == 'password'? true : false;
	$(element).bind('focus', Cnec.bind(this.focus, this));
	$(element).bind('blur', Cnec.bind(this.blur, this));
	this.blur(null);
}
Cnec.PlaceHolder.prototype.focus = function (e)
{
	if(this.element.value == this.hint)
	{
		$(this.element).removeClass("placeHolderMode");
		this.element.value = '';
		if(this.isPassword){this.element.type = 'password'; this.element.focus()}
	}
}
Cnec.PlaceHolder.prototype.blur = function (e){
	if(this.element.value == '') 
	{
		this.element.value = this.hint;
		$(this.element).addClass("placeHolderMode");
		if(!navigator.userAgent.match("MSIE|Presto"))this.element.type='text';
		else
			this.element.placeholder = this.hint;
	}
}


Cnec.VotingBox = function (element, args)
{
	this.element = element;
	this.endpoint = args.endpoint;
	this.votesCount = args.votesCount;
	this.contentId = args.contentId;
	this.votesTotal = args.votesTotal;
	this.votesAverage = this.votesCount == 0 ? 0 : Math.round(this.votesTotal / this.votesCount);
	this.stars = $(element).find(".star");
	this.stars.mouseenter(Cnec.bind(this.over, this));
	this.stars.click(Cnec.bindfn(this.click, this));
	$(element).mouseleave(Cnec.bind(this.out, this));
}

Cnec.VotingBox.prototype.addVotes = function (value)
{
	this.value = value;
	$.ajax({
		  url: this.endpoint,
		  dataType: 'json',
		  data: {jsoncall: '{"service":"VotingService", "method":"vote", "parameters":[' + this.contentId + ' , ' + (value + 1) +  ']}'},
		  success: Cnec.bind(this.onVote, this)
		});
}

Cnec.VotingBox.prototype.onVote = function (e)
{
	if(!e) return new Cnec.FancyHint(this.element, "Seu voto já foi registrado");
	var value = this.value;
	this.votesCount = this.votesCount + 1;
	this.votesTotal = this.votesTotal + value + 1;
	this.votesAverage = Math.round(this.votesTotal / this.votesCount);
	this.setVotes(this.votesAverage - 1);
	$(this.element).find(".totalVotes").html("(" + this.votesCount + ")");
	
	new Cnec.FancyHint(this.element, e);
}

Cnec.VotingBox.prototype.over = function (e)
{
	for(var i=0; i<5; i++)
	{
		if(this.stars[i] == e.target)
		{
			this.setVotes(i+1);
			return;
		}
	}
}

Cnec.VotingBox.prototype.click = function (e)
{
	for(var i=0; i<5; i++)
	{
		if(this.stars[i] == e.target)
		{
			this.addVotes(i++);
			return false;
		}
	}
	return false;
}

Cnec.VotingBox.prototype.out = function (e)
{
	this.setVotes(this.votesAverage);
}

Cnec.VotingBox.prototype.setVotes = function(value)
{
	for(var i=0; i<5; i++)
	{
		$(this.stars[i]).addClass("on");
		if(value <= i) $(this.stars[i]).removeClass("on");
	}
}

Cnec.FancyHint = function (element, msg)
{
	var extraclass = arguments[2] ? ' ' + arguments[2] : '';
	this.element = $("<span class='fancy-hint" + extraclass + "'>" + msg + "<span class='fancy-hint-bottom'></span></span>");
	$("body").append(this.element);
	this.element.position({
		  "my": "center",
		  "at": "top",
		  "of": $(element)
		});
	this.element.css("opacity", 0);
	this.element.animate({opacity:1, top: '-=15'}, "slow", Cnec.bindfn(this.startHide, this) );		
}

Cnec.FancyHint.prototype.startHide = function ()
{
	setTimeout(Cnec.bindfn(this.hide, this), 2000);
}
Cnec.FancyHint.prototype.hide = function ()
{
	this.element.animate({opacity:0, top: '-=15'}, "slow", Cnec.bindfn(this.destroy, this));
}
Cnec.FancyHint.prototype.destroy = function ()
{
	this.element.remove();
}


// ----------------------------------------------------------
Cnec.toJson = function (obj)
{
	var json = '';
	var comma = '';
	if(obj === null){
		return 'null';
	}
	if($.isArray(obj))
	{
		json += '[';
		for(var i=0; i < obj.length; i++)
		{
			json += comma + Cnec.toJson(obj[i]);
			comma = ', ';
		}
		json += ']';
		return json;
	}
	if(typeof obj == 'boolean')
	{
		return "" + obj;
	}
	if(typeof obj == 'object')
	{
		json += '{';
		for(var i in obj)
		{
			json += comma + '"' + i + '" : ' + Cnec.toJson(obj[i]);
			comma = ', ';
		}
		json += '}';
		return json;
	}
	if(typeof obj == 'string')
	{
    obj = obj.replace(/&/g, '%26').replace(/\r?\n/g,'\\'+'r'+'\\'+'n');
		return '"' + obj.replace(/"/g, '\\"')  +'"';
	}
	if(typeof obj == 'number')
	{
		return obj;
	}
	return 'null';
}

// RemoteObject
Cnec.RemoteObject = function(endpoint, serviceName)
{
	this.methods = [];
	this.endpoint = endpoint;
	this.serviceName = serviceName;
}

Cnec.RemoteObject.prototype.addMethod = function(name, callback) 
{
	this.methods[name] = {'callback':callback};
	this[name] = this.createMethod(this.callMethod, this, name);
};

Cnec.RemoteObject.prototype.callMethod = function(name) 
{
	var args = new Array();
	for(var i=0; i<arguments.length; i++) args.push(arguments[i]);
	args.shift();
	var request = {"service":this.serviceName, "method": name , "parameters": args};
	request = Cnec.toJson(request);
	var me = this;
	$.ajax(
		{
		  "url": this.endpoint,
		  "dataType": 'json',
		  "type": 'POST',
		  "data": {jsoncall: request},
		  "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
		  success:function(e){
			  me.methods[name].callback(e);
			 },
		  error: function(e){
		  }
		}
	);
};

Cnec.RemoteObject.prototype.createMethod = function(fn, obj, name){
	return function(){
	var args = new Array();
	for(var i=0; i<arguments.length; i++) args.push(arguments[i]);
	args.unshift(name);
	fn.apply(obj, args)};
};

// services
Cnec.Enquete = function(element, args)
{
	this.id = args.id;
	this.element = $(element);
	this.endpoint = args.endpoint;
	this.showLink = args.showLink ? true : false;
	this.service = new Cnec.RemoteObject(args.endpoint, "EnqueteService");
	this.service.addMethod("vote", Cnec.bindfn(this.onVote, this));
	this.element.bind("submit", Cnec.bindfn(this.click, this));
};

Cnec.Enquete.prototype.click = function(e)
{
	e.preventDefault();
	var option = $(this.element[0]).find("[name='option']:checked");
	if(option.length == 0) return; 
	this.service.vote(this.id, parseInt(option[0].value));
};

Cnec.Enquete.prototype.onVote = function(e)
{
	var enquetelist = Cnec.Cookies['enquete'];
	enquetelist = (enquetelist == null) ? this.id : enquetelist + "," + this.id;
	Cnec.Cookies.write("enquete", enquetelist, 365 * 24 * 60 * 60);
	
	this.element.find(".submit").remove();
	this.element.find("ul input").remove();
	this.element.find("li").append("<br /><span class='bar'></span><span class='percent'>0%</span>");
	if(this.showLink)
		this.element.append("<p><a href='" +  this.endpoint.replace("json", "enquetes") + "'>Veja mais enquetes</a></p>");
	else
		this.element.append("<p>Obrigado por votar</p>");
	
	var percentage = e;
	var percentage2 = percentage.slice();
	this.element.find(".percent").each(function(){$(this).html(percentage.shift() + "%");});
	this.element.find(".bar").css("backgroundPosition", "-197px");
	this.element.find(".bar").each(function(){$(this).animate({backgroundPosition: Math.round(-195 + (percentage2.shift()/100*165)) + 'px'}, "slow");});
};


//SendToFriendForm
SendToFriendForm = function(element, args)
{
	this.form = $("#Send-To-Friend-Form");
	this.form.draggable({handle: 'h4', containment: 'body'});
	$(element).click(Cnec.bindfn(this.showForm, this));
	this.form.find(".close").click(Cnec.bindfn(this.close, this));
	this.service = new Cnec.RemoteObject(args.endpoint, "SendToFriendService");
	this.service.addMethod("sendEmail", Cnec.bindfn(this.onSend, this));
	this.form.bind("submit", Cnec.bindfn(this.submit, this));
	this.validate = Cnec.bindfn(Cnec.validateForm, this.form[0]);
};

SendToFriendForm.prototype.showForm = function()
{
	document.body.appendChild(this.form[0]);
	this.form.find("input[type='submit']")[0].disabled = false;
	this.form.find("input[type='text'], textarea").attr("value", "");
	
	this.form.css('display', 'block');
	Cnec.posAt(this.form[0]);
	this.form.css('display', 'none');
	this.form.fadeIn();

}

SendToFriendForm.prototype.close = function()
{
	this.form.fadeOut();
}

SendToFriendForm.prototype.submit = function(e)
{
	e.preventDefault();
	if(!this.validate(e)) return;
	this.form.find("input[type='submit']")[0].disabled = true;
	var pageInfo = {};
	pageInfo.url = location.href;
	pageInfo.title = document.title;
	pageInfo.description = $("head meta[name='description']")[0].content;
	
	var emailInfo = {};
	emailInfo.senderName = this.form[0].senderName.value;
	emailInfo.senderEmail = this.form[0].senderEmail.value;
	emailInfo.friendName = this.form[0].friendName.value;
	emailInfo.friendEmail = this.form[0].friendEmail.value;
	emailInfo.comments = this.form[0].comments.value;
	
	this.service.sendEmail(pageInfo, emailInfo);
}

SendToFriendForm.prototype.onSend = function(e)
{
	new Cnec.FancyHint(this.form.find(".submit input")[0], "Mensagem enviada!");
	setTimeout(Cnec.bindfn(this.close , this), 3000);
}

//CommentForm
CommentForm = function(element, args)
{
	this.form = element;
	this.sending = false;
	this.contentId = args.contentId;
	this.service = new Cnec.RemoteObject(args.endpoint, "CommentService");
	this.service.addMethod("comment", Cnec.bindfn(this.onSend, this));
	$(this.form).bind("submit", Cnec.bindfn(this.submit, this));
	this.validate = Cnec.bindfn(Cnec.validateForm, this.form);
}

CommentForm.prototype.submit = function(e)
{
	e.preventDefault();
	if(this.sending) return;
	if(!this.validate(e)) return;
	this.sending = true;
	var postInfo = {};
	postInfo.email = this.form.email.value;
	postInfo.name = this.form.name.value;
	postInfo.comment = this.form.comment.value;
	
	this.service.comment(this.contentId, postInfo);
}

CommentForm.prototype.onSend = function(e)
{
	this.ip = e;
	new Cnec.FancyHint($(this.form).find(".commentSubmit input")[0], "Obrigado pelo seu comentário!<br /> ");
	setTimeout(Cnec.bindfn(this.close , this), 3000);
}

CommentForm.prototype.close = function(e)
{
	this.form.email.value = "";
	this.form.name.value = "";
	this.form.comment.value = "";
	$(".comment-ok-message").remove();
	$(this.form.parentNode.parentNode).prepend('<div class="comment-ok-message">Seu comentário foi enviado com sucesso e será publicado após avaliação de nossa equipe.<br /> Por motivos de segurança o endereço de seu computador foi registrado <b style="color:red">' + this.ip + '</b>.</div>');
	var to = $(".comment-ok-message").position().top - 30;
	$("html, body").animate({scrollTop: to}, "fast");
	this.sending = false;
}


//LoggedCommentForm
LoggedCommentForm = function(element, args)
{
	var form = $(element);
	var contentId = args.contentId;
	var service = new Cnec.RemoteObject(args.endpoint, "CommentService");
	service.addMethod("loggedComment", onSend);
	
	var validate = Cnec.bindfn(Cnec.validateForm, element);
	
	var ip = "";
	var replyStatus = form.find(".reply-status");
	var replyStatusLabel = replyStatus.find("i");
	var cancelReply = form.find(".cancel-reply");
	var replyButtons = $("#Comments .reply-button");
	
	form.find(".submit input").removeAttr("disabled");
	
	function exitReplyMode(){
		replyStatus.hide();
		element.reply.value = 0;
	}
	
	function enterReplyMode(replyId, author, date){
		element.reply.value = replyId;
		replyStatus.show();
		replyStatusLabel.text(author + " em " + date);
	}
	
	function onReply(){
		var button = $(this);
		var comment = button.parentsUntil("#Comments").last();
		if(!comment.is(".comment-box")) return;
		var replyId = button.data("comment-id");
		var author = comment.find(".author").text();
		var date = comment.find(".date").text();
		
		enterReplyMode(replyId, author, date);
		
		$("html, body").animate({scrollTop: form.offset().top - 50}, "normal");
	}
	
	function submit(e)
	{
		e.preventDefault();
		if(!validate(e)) return;

		form.find(".commentSubmit input").attr("disabled", "disabled");
		var postInfo = {};
		postInfo.comment = element.comment.value;
		postInfo.reply =  element.reply.value  ? parseInt(element.reply.value) : 0;

		service.loggedComment(contentId, postInfo);
	};
	
	function onSend(e)
	{
		ip = e;
		new Cnec.FancyHint(form.find(".commentSubmit input")[0], "Obrigado pelo seu comentário!<br /> ");
		setTimeout(close, 3000);
	}

	
	function close(e)
	{
		element.comment.value = "";
		form.html('<h3>Comentário enviado.</h3><p>Seu comentário foi enviado com sucesso, atualize a página para visualizá-lo.<br /> Por motivos de segurança o endereço de seu computador foi registrado <b style="color:red">' + ip + '</b>.</p>');
		setTimeout(function(){location = location;}, 1000);
		//var to = form.position().top - 30;
		//$("html, body").animate({scrollTop: to}, "fast");
	}
	
	form.find(".submit input").click(submit);
	replyButtons.click(onReply);
	cancelReply.click(exitReplyMode);
};






// CleanButton

Cnec.CleanButton = function (element, args)
{
	var input = $(element);
	input.addClass("cleanable");
	var button = $("<a class=\"clear-button\"><span>X</span></a>");
	
	function onClick()
	{
		if(input.hasClass("placeHolderMode")) return;
		input.val("");
		input.focus();
	}
	
	button.click(onClick);
	input.after(button);
};



//--------------------------------------------------------------------------
// Cnec Fiedl Constrain
Cnec.ErrorHint = function(element)
{
	var me = {};
	me.element = element;
	me.messageField = me.element.find(".message-content");
	me.html = function(message)
	{
		if(me.messageField.length > 0) me.messageField.html(message);
		else me.element.html(message);
			
		if(message == "") me.element.hide();
		else me.element.show();
	};
	return me;
};


Cnec.validateForm = function(e)
{
	for(var i=0; i< this.elements.length; i++)
	{
		if(this.elements[i].name == null) continue;
		if(this.elements[i].name == '') continue;
		if(this.elements[i].type == 'file') continue;
		if(this.elements[i].constrain != null)
			if(!this.elements[i].constrain.check())
			{
				var hint = $(this).find('.hint');
				if(hint.length > 0)
				{
					Cnec.ErrorHint(hint).html(this.elements[i].constrain.hint);
					$(this.elements[i]).addClass('invalid-state');
					var pos = Cnec.getRect(hint[0]).y;
					var pos2 = $(this).find("input[type=submit]").position().top;
					if(Math.abs(pos - pos2) > 200) 
						$("html, body").animate({scrollTop: pos}, "normal");
				}
				return false;
			} 
	}
 	return true;
}

Cnec.FieldCharRestriction = function (element, args)
{
	 var pattern = args.pattern;
	 $(element).bind("keydown", onKeyDown);
	 function onKeyDown(e) {
		 if(e.key.length == 1 && !e.key.match(pattern)) return false;
	 }
};

Cnec.FieldConstrain = function (element, args)
{
	 this.element = element;
	 element.constrain = this;
	 this.pattern = args.pattern;
	 this.hint = args.hint;
	 $(this.element).bind("blur", Cnec.bind(this.focusOut, this));
	 if(element.value != "")
	{
		 this.keyOn = true;
		 $(this.element).bind("keyup", Cnec.bind(this.focusOut, this));
	}
}

Cnec.FieldConstrain.prototype.focusOut = function(e)
{
	if(this.skip != null)
	{
			this.skip == null;
			return;
	}
	if(this.element.value != "" && !this.keyOn)
	 {
		 this.keyOn = true;
			 $(this.element).bind("keyup", Cnec.bind(this.focusOut, this));
	}
  var errorHint = Cnec.ErrorHint($(this.element.form).find(".hint"));
  if(this.check()){$(this.element).removeClass("invalid-state"); errorHint.html(''); return;}
  if($(this.element).hasClass("invalid-state")) return;
  errorHint.html(this.hint);
  $(this.element).addClass("invalid-state");
  new Cnec.FancyHint(this.element, this.hint, "error-hint");
}

Cnec.FieldConstrain.prototype.clean = function(e)
{
	this.skip = true;
  var errorHint = Cnec.ErrorHint($(this.element.form).find(".hint"));
  if(this.element.value == "" || this.check()){$(this.element).removeClass("invalid-state"); errorHint.html(''); return;}
  if($(this.element).hasClass("invalid-state")) return;
  errorHint.html(this.hint);
  $(this.element).addClass("invalid-state");
  new Cnec.FancyHint(this.element, this.hint, "error-hint");
}

Cnec.FieldConstrain.prototype.check = function()
{
	if(this.element.value.match(this.pattern))return true;
	return false;
}

//cpf
Cnec.MatchCPF = function(element, args)
{
	 this.element = element;
	 this.notRequired = args.notRequired != null ? true : false;
	 element.constrain = this;
	 this.pattern = args.pattern;
	 this.hint = args.hint;
	 $(this.element).bind("blur", Cnec.bind(this.onFocusOut, this));	
}

Cnec.MatchCPF.prototype.check = function()
{
	var cpf = this.element.value.replace(/[^\d]/g,'');
	if(cpf == "" && this.notRequired) return true;
	var i2 = 0;
	var t1 = 0;
	var t2 = 0

	for(var i=10; i>=2; i--)
	{
		t1 += parseInt(cpf.charAt(i2))*i;
		t2 += parseInt(cpf.charAt(i2++))*(i+1);
	}

	var r = t1 % 11;
	var t = (t1 - r) / 11; 
	var d1 = r < 2 ? 0 : 11 - r;
	
	t2 += 2 * d1;
	var r2 = t2 % 11;
	var d2 = r2 < 2 ? 0 : 11 - r2;
	
	return cpf.match( new RegExp('.{9}'+d1+''+d2+'$') );
}

Cnec.MatchCPF.prototype.onFocusOut = function(e)
{
	var errorHint = Cnec.ErrorHint($(this.element.form).find(".hint"));
	if(this.check()){$(this.element).removeClass("invalid-state");  errorHint.html(''); return;}
	errorHint.html(this.hint);
	$(this.element).addClass("invalid-state");
	new Cnec.FancyHint(this.element, this.hint, "error-hint");
}


// Previous

Cnec.PreviousFieldConstrain = function (element, args)
{
	 this.element = element;
	 element.constrain = this;
	 this.previousField  = args.previousField;
	 this.hint = args.hint;
	 $(this.element).bind("blur", Cnec.bind(this.focusOut, this));	
}

Cnec.PreviousFieldConstrain.prototype.focusOut = function(e)
{
	var errorHint = Cnec.ErrorHint($(this.element.form).find(".hint"));
	if(this.check()){$(this.element).removeClass("invalid-state");  errorHint.html(''); return;}
	errorHint.html(this.hint);
	$(this.element).addClass("invalid-state");
	new Cnec.FancyHint(this.element, this.hint, "error-hint");
}

Cnec.PreviousFieldConstrain.prototype.check = function()
{
	if(this.element.value == this.element.form[this.previousField].value )return true;
	return false;
}

$(document).ready(function(){
	Cnec.bindComponents();
	$(".validatedForm").submit(Cnec.validateForm);
	initFontSizeControl();
});


//--------------Password Strengh Checker
Cnec.PasswordStrengthChecker = function(element, args)
{
	element = $(element);
	var fieldToWatch = $(args.fieldToWatch);
	var label = element.find(".label");
	
	function isSequence(term)
	{
		for(var i = 1; i < term.length; i++)
		{
			var c1 = term.charCodeAt(i-1);
			var c2 = term.charCodeAt(i);
			if(Math.abs(c2-c1) > 1) return false;
		}
		return true;
	}
	
	function matchWeakTerms(terms, str)
	{
		if(terms == null) return false;
		for(var i = 0; i < terms.length; i++)
		{
			if(str.toLowerCase() == terms[i].toLowerCase()) return true;
		}
		return false;
	}
	var lastValue = "";
	fieldToWatch.keyup(function()
	{
		var value = fieldToWatch.val();
		if(lastValue == value) return;
		lastValue = value;
		
		element.removeClass('empty');
		element.removeClass('too-weak');
		element.removeClass('weak');
		element.removeClass('good');
		element.removeClass('strong');
		
		value = value.replace(/ /g, "");
		if(value.match(/^$/))
		{
			element.addClass('empty');
			label.html("");
			return;
		}
		
		if(isSequence(value) || matchWeakTerms(args.weakTerms, value))
		{
			element.addClass('too-weak');
			label.html("Muito fraca!");
			return;
		}
		if(value.length < 5 || value.match(/^(\d+|[a-z]+)$/i))
		{
			if(value.length>10){
				element.addClass('good');
				label.html("Boa!");
				return;
			}
			element.addClass('weak');
			label.html("Fraca!");
			return;
		}
		if(value.match(/\d/) && value.match(/[a-z]/i) && value.match(/[^\w\d]/))
		{
			element.addClass('strong');
			label.html("Forte!");
			return;
		}
		
		element.addClass('good');
		label.html("Boa!");
		return;
		
	});		
	
}

//masks
Cnec.FieldMask = function(element, args)
{
  this.element = element;
  this.active = true;
  this.max = 0;
  this.numChars = new Array();
  this.maskChars = new Array();
  this.get='';
  this.replace=''; 
  this.count = 1;
  args.mask.replace(/(#+|[^#]+)/g, Cnec.bindfn(this.parse, this));
  $(element).bind('keyup',  Cnec.bindfn(this.onkup, this));
  $(element).bind('blur',  Cnec.bindfn(this.onBlur, this));
  this.get = new RegExp(this.get+".*?",'g');
  
}

Cnec.FieldMask.prototype.parse = function()
{
	var e = arguments[0];
	if(!e.match('#+'))
	{
		if( this.max==0) this.numChars.push(0);
		this.maskChars.push(e);
		this.max += e.length;
		this.replace+=e;
	}
	else
	{
		this.numChars.push(e.length);
		this.max += e.length;
		this.replace+='$'+ (this.count++);
		this.get+="(\\d{"+e.length+"})";
	}
}

Cnec.FieldMask.prototype.onkup = function(e)
{
	if(!this.active) return;
	if (e.keyCode == 8 || e.keyCode == 46 || e.keyCode == 37 || e.keyCode == 39) return;
	var s = this.element.value;
	if(s.length >= this.max) {
		s = s.substring(0, this.max);
		s = s.replace(/[^\d]+/g, ""); 
		this.element.value = s.replace(this.get, this.replace);
		return;
	}
	
	s = s.replace(/[^\d]+/g, "");
	var nc = 0;
	
	for(var i = 0; i < this.maskChars.length; i++)
	{
		nc += this.numChars[i];
		if(s.length < nc) break;
		var tail =  s.substring(nc);
		var chars = this.maskChars[i] ? this.maskChars[i] : "";
		s = s.substring(0, nc) + chars + (tail == null ? "" : tail);
		nc+= this.maskChars[i].length;
	}
	this.element.value = s;
}

Cnec.FieldMask.prototype.onBlur = function(e)
{
	if(!this.active) return;
	var s = this.element.value;
	if(s=="") return;
	if(!s.match(/\d/)) {this.element.value = ""; return;}
	if(s.length >= this.max) {
		s = s.substring(0, this.max);
		s = s.replace(/[^\d]+/g, ""); 
		this.element.value = s.replace(this.get, this.replace);
		return;
	}
	
	s = s.replace(/[^\d]+/g, "");
	var nc = 0;
	
	for(var i = 0; i < this.maskChars.length; i++)
	{
		nc += this.numChars[i];
		if(s.length < nc) break;
		var tail =  s.substring(nc);
		var chars = this.maskChars[i] ? this.maskChars[i] : "";
		s = s.substring(0, nc) + chars + (tail == null ? "" : tail);
		nc+= this.maskChars[i].length;
	}
	this.element.value = s;
}


DivSlider = function(element, args)
{
	this.element  = element;
	this.delay = args.delay ? args.delay : 5000;
	this.tagElement = args.tagElement ? args.tagElement : 'DIV';
	this.children = new Array();
	for(var child = this.element.firstChild; child != null; child = child.nextSibling)
	{
		if(child.nodeName == this.tagElement.toUpperCase()) this.children.push(child);
	}
	this.current = 0;
	setInterval(Cnec.bind(this.change, this), this.delay);
}

DivSlider.prototype.change = function()
{
	var oldCurrent = this.current;
	this.current = (oldCurrent + 1) == this.children.length ? 0 : oldCurrent + 1;
	$(this.children[oldCurrent]).fadeOut("normal");
	$(this.children[this.current]).fadeIn("normal");
}

Cnec.RealtimeSearch = function (element, args)
{
	this.service  = new Cnec.RemoteObject(args.endpoint, "RealtimeSearch");
	this.service.addMethod("find", Cnec.bindfn(this.onResult, this));
	this.element = element;
	this.oldValue = "";
	this.skipBlur = false;
	$(this.element.form).bind("submit", Cnec.bindfn(this.submit, this));
	$(this.element).bind("keyup", Cnec.bindfn(this.change, this));
	$(document).bind("click",  Cnec.bindfn(this.hide, this));
}

Cnec.RealtimeSearch.prototype.submit = function (e)
{
	if(this.resultBox == null) return true;
	var selected = this.resultBox.find(".selected"); 
	if(selected.length == 0) return true;
	selected.click();
	return false;
}

Cnec.RealtimeSearch.prototype.hide = function (e)
{
	if(this.resultBox == null) return;
	if(e.target == this.element) return;
	var me= this;
	me.resultBox.fadeOut("normal", function(){me.resultBox.remove();});
	
}

Cnec.RealtimeSearch.prototype.change = function (e)
{
	this.select(e);
	if(this.element.value.length < 3) 
	{
		if(this.resultBox != null)
		{
			var me = this;
			this.resultBox.fadeOut("normal", function(){me.resultBox.remove();});
		}
		this.oldValue = this.element.value;
		return;
	}
	if(this.oldValue != this.element.value)
		this.service.find(this.element.value);
	this.oldValue = this.element.value
}

Cnec.RealtimeSearch.prototype.select = function (e)
{
	if (this.resultBox == null) return;
	if(e.keyCode == 13) return;
	var items = this.resultBox.find("li");
	
	var selectedIndex = -1;
	for(var i = 0; i < items.length; i++)
	{
		if($(items[i]).hasClass("selected"))
		{
			selectedIndex = i;
			break;
		}
	}
	if(selectedIndex >= 0)
		$(items[selectedIndex]).removeClass("selected");
	switch(e.keyCode)
	{
		//up
		case 38:
			if(selectedIndex <= 0)
			{
				$(items[items.length - 1]).addClass("selected")
				this.highlight();
				return;
			}
			$(items[selectedIndex - 1]).addClass("selected")
			this.highlight();
			break;
		//down
		case 40:
			if(selectedIndex+1 == items.length)
			{
				$(items[0]).addClass("selected")
				this.highlight();
				return;
			}
			$(items[selectedIndex + 1]).addClass("selected")
			this.highlight();
			break;
	}
}

Cnec.RealtimeSearch.prototype.highlight = function()
{
	var item = this.resultBox.find(".selected");
	var items = this.resultBox.find("ul");
	var scrollTo = items.scrollTop() + item.position().top;
	items.stop(true);
	items.animate({scrollTop:  scrollTo - 200}, "normal");
}


Cnec.RealtimeSearch.prototype.onResult = function (result)
{
	if(this.resultBox == null)
	{
		this.resultBox = $("<div id='SugestionBox'></div>");
	}
	if(result == "")
	{
		this.resultBox.remove();
		return;
	}
	this.resultBox[0].innerHTML = result;
	$("body").append(this.resultBox);
	this.resultBox.fadeIn("normal");
	this.resultBox.position({
		  "my": "right top",
		  "at": "right bottom",
		  "of": $(this.element.form),
		  "offset": "0 4px"
		});
}


Cnec.HiddenMenu = function (element, args)
{
	this.markSelected = args.markSelected;
	this.isMinSize = false;
	this.my = args.my ? args.my : "left top"; 
	this.at = args.at ? args.at : "left bottom";
	this.offset = args.offset ? args.offset : "0 0";
	this.minSizeElement = args.minSizeElement ? $(args.minSizeElement) : null;
	this.ofMinSize = args.ofMinSize;
	this.menu = $(args.menu);
	this.element = $(element);
	this.of = args.of ? $(args.of) : this.element;
	this.element[0].hiddenMenu = this;
	this.clickRequired = false;
	this.clickRef = Cnec.bindfn(this.onClick, this);
	var me = this;
	this.element.click(function(e){
		if(!me.animating && me.element.hasClass("hover")) {me.hideMenu({relatedTarget:null}); return false;}
		if(!me.animating && !me.element.hasClass("hover")) me.showMenu({relatedTarget:null});
		
		return false;
	});
	var isAndroid = (navigator.userAgent + "a").match(/android|zbov/i);
	if(!isAndroid)
		this.element.hover(Cnec.bindfn(this.showMenu, this), Cnec.bindfn(this.hideMenu, this));
	else
		$(document).click(function(e){
			me.hideMenu(e);
		});
	//else
	//	this.element.hover(function(){}, Cnec.bindfn(this.hideMenu, this));
	this.menu.hover(Cnec.bindfn(this.showMenu, this), Cnec.bindfn(this.hideMenu, this));
}

Cnec.HiddenMenu.prototype.showMenu = function(e)
{
	var of = this.getOf();
	if(this.isMinSize)
	{
		if(e.relatedTarget == this.element[0]) return;
		if(e.relatedTarget == this.menu[0] && this.menu.hasClass("hover")) return;
	}
	//if(this.animating) return;
	this.element.addClass("hover");
	this.of.addClass("hover");
	if(this.markSelected != null) this.element.parent().addClass(this.markSelected);
	this.menu.css("display" , 'block');
	this.menu.position({
		  "my": this.my,
		  "at": this.at,
		  "of": of,
		  "offset": this.isMinSize ? "" : this.offset,
		  "collision": 'none'
		});
	if(this.isMinSize)
	{
		this.animating = true;
		this.menu.hide();
		this.menu.stop(true, true);
		var me = this;
		this.menu.slideDown("normal", function(){me.animating = false;});
	}
}

Cnec.HiddenMenu.prototype.getOf = function()
{
	this.isMinSize = false;
	if(this.minSizeElement == null) return this.of;
	if(this.minSizeElement.width() < this.ofMinSize)
	{
		this.menu.css('position', 'relative');
		this.isMinSize = true;
		return this.element;
	}
	this.menu.css('position', 'absolute');
	return this.of;
}

Cnec.HiddenMenu.prototype.hideMenu = function(e)
{
	//if(this.animating) return;
	var of = this.getOf();
	if(this.isMinSize)
	{
		if(e.relatedTarget == this.of[0]) return;
		if(e.relatedTarget == this.menu[0]) return;
	}
	if(this.clickRequired) return;
	if(this.markSelected != null) this.element.parent().removeClass(this.markSelected);
	this.element.removeClass("hover");
	this.of.removeClass("hover");
	if(this.isMinSize) 
	{
		this.animating = true;
		this.menu.stop(true, true);
		var me = this;
		this.menu.slideUp("normal", function(){me.animating = false;});
	}
	else this.menu.css("display" , 'none');
}

Cnec.HiddenMenu.prototype.requireClick = function(e)
{
	this.clickRequired = true;
	$(document).click(this.clickRef);
}


Cnec.HiddenMenu.prototype.onClick = function(e)
{
	var o = e.target;
	var ok = false;
	for(;o != null; o = o.parentNode)
	{
		if(o == this.menu[0])
		{
			ok = true;
			break;
		}
	}
	if(ok) return;
	this.clickRequired = false;
	this.hideMenu(e);
}


//FieldGroupList
/*
 * Div with sub divs classnamed 'item'.
 * those items must have elements classnamed 'add-button' and 'remove-button'
 */
Cnec.FieldGroupList = function (element, args)
{
	var me = this;
	this.element = $(element);
	this.element.find(".item").each(Cnec.bindfn(this.bindEvent, this));
}

Cnec.FieldGroupList.prototype.bindEvent = function(element)
{
	if(arguments[1] != null) element = arguments[1];
	$(element).find('.add-button').click(Cnec.bindfn(this.add, this));
	$(element).find('.remove-button').click(Cnec.bindfn(this.remove, this));
}

Cnec.FieldGroupList.prototype.add = function(e)
{
	var element = e.target != null ? $(e.target).parentsUntil(this.element, '.item')  : e;
	var newElement = element.clone();
	element.after(newElement);
	Cnec.bindComponents(newElement[0]);
	this.bindEvent(newElement);
	newElement.find("input").val("");
	if(arguments[1] != true)
	{
		newElement.hide();
		newElement.slideDown('fast');
	}
	return newElement;
}

Cnec.FieldGroupList.prototype.remove = function(e)
{
	if(this.element.find(".item").length < 2) return;
	var element = $(e.target).parentsUntil(this.element, '.item');
	element.slideUp('fast', function(){element.detach();});
}

function initFontSizeControl()
{
	var c = Cnec.Cookies['fontsize'];
	if(c)
	{
		$(".font-size-control .selected").removeClass('selected');
		fontSizeAdjust("normal", c );
	}
	$(".font-size-control").click(fontSizeControlAdjust);	
}

function fontSizeAdjust(oldSize, newSize)
{
	if(!newSize.match(/big|small|normal/)) newSize = 'normal';
	$(".variable-font-container").removeClass("font-" + oldSize);
	$(".variable-font-container").addClass("font-" + newSize);
	$(".font-size-control ." + newSize).addClass("selected");
	Cnec.Cookies.write('fontsize', newSize, 24*60*60*30);
}

function fontSizeControlAdjust(e) 
{
	if($(e.target).hasClass(".font-size-control")) return;
	var selected  = $(".font-size-control .selected");
	if($(e.target).hasClass("selected")) return;
	if($(e.target).hasClass("plus"))
	{
		if (selected.hasClass("big")) return;
		selected.removeClass("selected");
		if (selected.hasClass("normal")){ 
			fontSizeAdjust("normal", "big");
			return;
		}
		if (selected.hasClass("small")){ 
			fontSizeAdjust("small", "normal");
			return;
		}
	}
	if($(e.target).hasClass("minus"))
	{
		if (selected.hasClass("small")) return;
		selected.removeClass("selected");
		if (selected.hasClass("normal")){
			fontSizeAdjust("normal", "small");
			return;
		}
		if (selected.hasClass("big")){
			fontSizeAdjust("big", "normal");
			return;
		}
	}
	selected.removeClass("selected");
	fontSizeAdjust(selected[0].className, e.target.className);	
}

Cnec.DatePicker = function (element, args)
{
	new Cnec.FieldMask(element, {"mask":"##/##/####"});
	var datePicker = $(element).datepicker($.datepicker.regional["pt-BR"]);
	function fixConstrain(dateText, inst) {
		if(element.constrain != null)
			element.constrain.clean();
	}
	datePicker.datepicker("option", "onSelect", fixConstrain);
	datePicker.datepicker("option", "onClose", fixConstrain);
	datePicker.datepicker("option", "beforeShow", fixConstrain);
}

Cnec.DateTimePicker = function (element, args)
{
	new Cnec.FieldMask(element, {"mask":"##/##/#### ##:##"});
	$(element).datetimepicker($.datepicker.regional["pt-BR"]);
}

Cnec.makeLink = function (str)
{
	return str.toLowerCase()
	.replace(/[àáâãª]/g, "a")
	.replace(/[éê]/g, "e")
	.replace(/[í]/g, "i")
	.replace(/[óôõº]/g, "o")
	.replace(/[ûúü]/g, "u")
	.replace(/[ç]/g, "c")
	.replace(/[^a-z0-9 -]/g, "")
	.replace(/[ -]+/g, "-");
}

Cnec.MakeLinker = function(element, args) {
	element = $(element);
	var baseElement = $(args.baseElement);
	
	var active = Cnec.makeLink(baseElement.val()) == element.val();
	
	baseElement.bind('keyup', function() {
		if(baseElement.val() == '') active = true;
		if(!active) return;
		element.val(Cnec.makeLink(baseElement.val()));
	});
	
	element.blur(function()	{
		element.val(Cnec.makeLink(element.val().replace(/-/g, " ")));
		active = Cnec.makeLink(baseElement.val()) == element.val();
		if(element.val() == "")
		{
			active = true;
			element.val(Cnec.makeLink(baseElement.val()));
		}
	});
};


//==================== Cnec.PhotoUpload =====================

Cnec.PhotoUpload = function(element, args)
{
	var file = $(element);
	var form = $(element.form);
	var photo = form.find(".photo img");
	var progressBar = form.find(".progress-bar");
	var progressRatioLabel = progressBar.find(".progress-ratio"); 
	var progressRatioBar = progressBar.find(".fill-bar-sent");
	var errorBlock = form.find(".error-block");
	var errorContentMessage = errorBlock.find(".content-message");
	var successBlock = form.find(".success-block");
	var successContentMessage = successBlock.find(".content-message");
	
	function cleanMessages()
	{
		successBlock.addClass("none");
		errorBlock.addClass("none");
		progressBar.hide();
	}
	
	function errorMessage(message)
	{
		errorBlock.removeClass("none");
		errorContentMessage.html(message);
	}
	
	function successMessage(message)
	{
		successBlock.removeClass("none");
		successContentMessage.html(message);
	}
	
	function uploadProgress(e)
	{
		var ratio = e.loaded / e.total;
		progressBar.show();
		progressRatioLabel.html(Math.round(ratio * 100) + " %");
		progressRatioBar.css("width", (ratio * 100) + "%");
	}
	
	function uploadComplete(e)
	{
		progressBar.hide();
		successMessage("A foto foi enviada!");
		var imgUrl = e.target.responseText;
		photo.attr("src", imgUrl);
	}
	
	function uploadFailed()
	{
		errorMessage("Erro ao enviar o arquivo!");
	}
	
	function uploadCanceled()
	{
		errorMessage("Upload foi cancelado!");
	}
	
	function getFormData()
	{
		if("getFormData" in form[0])
			return form[0].getFormData();
		if(!FormData) return null;
		var formData = new FormData();
		for(var i = 0; i < form[0].elements.length; i++)
		{	
			var item = form[0].elements[i];
			if(item.type == 'file')
			{
				formData.append(item.name, item.files[0]);
				continue;
			}	
			formData.append(item.name, item.value);
		}
		return formData;
	}
	
	function uploadFile() {
		var xhr = new XMLHttpRequest();
		var formData = getFormData();

		xhr.upload.addEventListener("progress", uploadProgress, false);
		xhr.addEventListener("load", uploadComplete, false);
		xhr.addEventListener("error", uploadFailed, false);
		xhr.addEventListener("abort", uploadCanceled, false);
		 
		xhr.open("POST", form.attr("action"));
		xhr.send(formData);
	}
	
	function onFileSelect(e)
	{
		if(!("files" in element))
		{
			form.find(".submit-button-box").show();
			return;
		}
		var fileInfo = element.files[0];
		form.find(".file-info").html(
				"nome: " + fileInfo.name + "<br />" +
				"tamanho: " + fileInfo.size + "<br />" +
				"tipo: " + fileInfo.type + "<br />"
			);
		if(!fileInfo.type.match(/image\/(jpeg|gif|png)/i))
		{
			errorMessage("Por favor selecionar somente imagens JPG!");
			return;
		}
		if(fileInfo.size > 200 * 1204)
		{
			errorMessage("Por favor selecionar imagem de até 200KB!");
			return;
		}
		uploadFile();
		return;
	}
	
	function onClick()
	{
		cleanMessages();
		if(!("files" in file[0]))
		{
			form.find(".submit-button-box").show();
			return;
		}
		file.click();
		return false;
	}
	
	file.bind("change", onFileSelect);
	file.attr("accept", "image/*");
	var uploadButton = form.find(".upload-button");
	uploadButton.click(onClick);
}


//----------------------Cnec.Gallery-----------------------------
Cnec.Gallery = function(element, args)
{
	this.title = args.label;
	this.images = args.images;
	this.template = '<table id="cnec-gallery">\
		<tr class="title">\
			<td colspan="3"><h3><a class="close"></a><span>Galeria</span></h3></td>\
		</tr>\
		<tr class="big-image">\
			<td colspan="3"><span class="previous-photo"></span><span class="loading"></span><img src="" onload="this.previousSibling.style.display = \'none\'; this.style.display = \'inline-block\';" /><span class="next-photo"></span><span class="slide-mode">Ativar modo Slide</span></td>\
		</tr>\
		<tr class="thumbs">\
			<td class="previous-button"></td>\
			<td class="items"><div></div></td>\
			<td class="next-button"></td>\
		</tr>\
	</table>';
	this.noThumbs = args.noThumbs;
	if(element)
		$(element).click(Cnec.bindfn(this.show, this));
	this.refResizeAjust = Cnec.bindfn(this.resizeAdjust, this);
	this.refKeyDown = Cnec.bindfn(this.onKeyDown, this);
	this.refMouseWheel = Cnec.bindfn(this.onMouseWheel, this);
	this.lastWheelEventTime = new Date().getTime();
	this.defaultIndex = 0;
};


Cnec.Gallery.prototype.show = function(e)
{
	$("body").append(this.template);
	$("body").css("overflow", "hidden");
	var me = this;
	this.gallery = $("#cnec-gallery");
	if(this.noThumbs)
		this.gallery.find(".thumbs").hide();
	
	var scrollAmount = $("document, html, body").scrollTop();
	if(scrollAmount == 0) scrollAmount = document.body.scrollTop;
	
	this.gallery.css("top", scrollAmount + "px");
	this.gallery.find("h3 span").html(this.title);
	this.slideButton = this.gallery.find(".slide-mode"); 
	this.bigImage = this.gallery.find(".big-image img");
	this.gallery.find(".big-image").click(function(e){
		if(e.target.nodeName == 'TD')
			me.close();
	});
	this.slideModeTimeHandle = null;
	
	var imageList = "";
	for(var i=0; i < this.images.length; i++)
	{
		imageList += "<img src='" + this.images[i].url +  "-thumb.jpg' title='" + this.images[i].title + "' />";
	}
	
	var itemsHolder = this.gallery.find(".thumbs .items div");
	this.resizeAdjust(null);
	
	itemsHolder.append(imageList);
	
	this.gallery.find(".thumbs img").click(Cnec.bindfn(this.showImage, this));
	this.gallery.find(".thumbs img").eq(this.defaultIndex).click();
	this.gallery.find(".close").click(Cnec.bindfn(this.close, this));
	this.gallery.find(".next-button").click(function () {itemsHolder.animate({"scrollLeft": (itemsHolder[0].scrollLeft + itemsHolder.parent().width() ) + "px"}, "normal", "easeInOutQuad");});
	this.gallery.find(".previous-button").click(function () {itemsHolder.animate({"scrollLeft": (itemsHolder[0].scrollLeft - itemsHolder.parent().width() ) + "px"}, "normal", "easeInOutQuad");});
	this.gallery.find(".next-photo").click(Cnec.bind(this.next, this));
	this.gallery.find(".previous-photo").click(Cnec.bind(this.prev, this));
	
	this.gallery.find(".big-image img").hover(Cnec.bindfn(this.showSlideButton, this), Cnec.bindfn(this.hideSlideButton, this));
	this.slideButton.click(Cnec.bindfn(this.toogleSlideMode, this));
	
	$(window).bind("resize", this.refResizeAjust);
	$(document).bind("keydown", this.refKeyDown);
	$(document).bind("mousewheel", this.refMouseWheel);
	$(document).bind("DOMMouseScroll", this.refMouseWheel);
};

Cnec.Gallery.prototype.resizeAdjust = function(e)
{
	var itemsHolder = this.gallery.find(".thumbs .items div");
	itemsHolder.css("width",  "10px");
	var w = itemsHolder.parent().width();
	if(navigator.userAgent.match(/MSIE [78]/)) w = Cnec.viewPort().width - 50;
	itemsHolder.css("width", w + "px");
	if(itemsHolder[0].scrollWidth > 0)
	{	
		this.gallery.find(".next-button").removeClass("disable");
		this.gallery.find(".previous-button").removeClass("disable");
	}
	else
	{	
		this.gallery.find(".next-button").addClass("disable");
		this.gallery.find(".previous-button").addClass("disable");
	}
};

Cnec.Gallery.prototype.toogleSlideMode = function()
{
	if(this.slideModeTimeHandle == null)
	{
		this.slideModeTimeHandle = setInterval(Cnec.bindfn(this.next, this), 5000);
		this.slideButton.html("Desativar Modo Slide");
	}
	else
	{
		clearInterval(this.slideModeTimeHandle);
		this.slideModeTimeHandle = null;
		this.slideButton.html("Ativar Modo Slide");
	}
	this.slideButton.position({
		  "my": "top center",
		  "at": "center top",
		  "of": ".big-image img",
		  "offset" : "0 30px"
		});
};

Cnec.Gallery.prototype.showSlideButton = function(e)
{
	this.slideButton.css("display", "block");
	if(e.target == this.bigImage[0])
		this.slideButton.fadeIn("normal");
	this.slideButton.position({
		  "my": "top center",
		  "at": "center top",
		  "of": ".big-image img",
		  "offset" : "0 30px"
		});
};

Cnec.Gallery.prototype.hideSlideButton = function(e)
{
	if(e.relatedTarget == this.slideButton[0]) return;
	this.slideButton.fadeOut("normal");
};

Cnec.Gallery.prototype.close = function(e)
{
	if(this.slideModeTimeHandle != null) clearInterval(this.slideModeTimeHandle);
	this.gallery.remove();
	$(window).unbind("resize", this.refResizeAjust);
	$(document).unbind("keydown", this.refKeyDown);
	$(document).unbind("mousewheel", this.refMouseWheel);
	$(document).unbind("DOMMouseScroll", this.refMouseWheel);
	$("body").css("overflow", "auto");
};

Cnec.Gallery.prototype.next = function()
{
	var img = this.gallery.find(".items .selected");
	img = img.length == 0 ? this.gallery.find(".items img:eq(0)") : img.next();
	if(img.length == 0) img = this.gallery.find(".items img:eq(0)");
	img.click();
};

Cnec.Gallery.prototype.prev = function()
{
	var img = this.gallery.find(".items .selected");
	img = img.length == 0 ? this.gallery.find(".items img:last-child") : img.prev();
	if(img.length == 0) img = this.gallery.find(".items img:last-child");
	img.click();
};


Cnec.Gallery.prototype.onKeyDown = function(e)
{
	switch(e.keyCode)
	{
		case 27: return this.close(null);
		case 37: return this.prev();
		case 39: return this.next();
	}
};

Cnec.Gallery.prototype.onMouseWheel = function(e)
{
	
	if(	(new Date().getTime() - this.lastWheelEventTime) < 200) return;
	this.lastWheelEventTime = new Date().getTime();
	
	
	var delta = e.detail == 0 ? e.wheelDelta * -1 : e.detail; 
	if(delta > 0) this.prev();
	else this.next();
};


Cnec.Gallery.prototype.showImage = function(e)
{
	var img = $(e.target);
	img.parent().find(".selected").removeClass("selected");
	img.addClass("selected");
	var bigImage = this.gallery.find(".big-image img");
	bigImage.prev().css("display", "inline-block");
	bigImage.css("display", "none");
	bigImage.attr("src", img.attr("src").replace("-thumb", "")); 
};

//---------MP3Player------------------------------------------------------------------
function html5AudioPlayer(){
	var audio = document.createElement('audio');
	if(!audio) return null;
	if(!audio.canPlayType) return null;
	if(!audio.canPlayType('audio/mpeg')) return null;
	audio.autoplay = true;
	var player = {};
	player.play = function() {audio.play();};
	player.playURL = function(url) {audio.src = url;};
	player.pause = function() {audio.pause();};
	player.seek = function(pos) {audio.currentTime = pos / 1000;};
	player.getPosition = function() {return Math.round(audio.currentTime*1000);};
	player.getDuration = function() {return Math.round(audio.duration*1000);};
	return player;
} 

Mp3Player = function (element, args)
{
	this.element = $(element);
	this.player = html5AudioPlayer();
	if(!this.player)
		this.player = (jQuery.browser.msie) ? MP3Player : $(element).find("embed")[0];
	this.errorMode = false;
	
	this.skin = $(element).find(".skin");
	this.createSlider();
	this.skin.find(".play-button").click(Cnec.bindfn(this.tooglePlay, this));
	
	this.refUpdateInfo = Cnec.bindfn(this.updateInfo, this);
	
	this.playing = false;
	this.draggingPin = false;
	
	this.currentTime = 0;
	this.totalTime = 0;
	
	element.mp3Player = this;
	window.mp3Player = this;
};

Mp3Player.prototype.bindUserEvents = function(){
	this.createSlider();
	this.skin.find(".play-button").click(Cnec.bindfn(this.tooglePlay, this));
};

Mp3Player.prototype.displayTime = function(milliseconds)
{
	var date  = new Date(2000, 1, 1);
	date.setMilliseconds(milliseconds);
	return  date.getMinutes() + ":" + (date.getSeconds() < 10 ?  "0"  :  "") +  date.getSeconds() ;
};

Mp3Player.prototype.setSliderPos = function(pos)
{
	if(this.draggingPin) return;
	pos = pos * this.sliderWidth;
	this.pin.css("left", pos);	
};

Mp3Player.prototype.createSlider = function()
{
	this.pin = this.skin.find(".pin");
	this.slider = this.skin.find(".slider");
	
	var me = this;
	this.pin.draggable({containment: ".slider", 
		start: function () {me.draggingPin = true;},
		stop: function () {
			me.player.seek( parseInt(me.pin.css("left")) / me.sliderWidth  * me.player.getDuration());
			me.draggingPin = false;
			me.playing = true;
			me.skin.addClass("playing");
			me.updateInfo();
	}});
};

Mp3Player.prototype.tooglePlay = function()
{
	this.playing ? this.pause() : this.play();
};

Mp3Player.prototype.pause = function()
{
	try
	{
		this.player.pause();
	}
	catch(e){
		$(".listen-button").css("display", "none");
		this.errorMode = true;
	}
	this.playing = false;
	this.skin.removeClass("playing");
	this.skin.find('.label').html("Ouvir");
};

Mp3Player.prototype.play = function()
{
	if(arguments.length > 0)
		this.player.playURL(arguments[0]);
	else
		this.player.play();

	
	this.playing = true;
	this.skin.addClass("playing");
	this.skin.find('.label').html("Pausar");
	this.updateInfo();
};

Mp3Player.prototype.updateInfo = function()
{
	this.currentTime = this.player.getPosition(); 
	this.totalTime = this.player.getDuration();
	
	$(".current-time").html(this.displayTime(this.currentTime));
	$(".total-time").html(this.displayTime(this.totalTime));		
	
	this.setSliderPos(this.currentTime / this.totalTime);
	if(this.playing) setTimeout(this.refUpdateInfo, 33);
};

Mp3Player.prototype.addSkinTo = function(element, songUrl)
{
	element.append(this.skin);
	this.pinWidth = this.pin.width();
	this.sliderWidth = this.slider.width() - this.pinWidth;
    this.setSliderPos(0);
	this.play(songUrl);
};

Mp3Player.prototype.removeSkin = function()
{
	this.pause();
	this.element.append(this.skin);
};

//------------------------- WikiMp3Player -------------------------------
WikiMp3Player = function(element, args){
	var players = [];
	var mp3Player = {};
	function selectMp3Links(index, a){
		if(!a.href.match(/\.mp3$/)) return;
		var link = $(a);
		var playerHolder = $("<div class='square-button listen-button'><span class='label'>Ouvir</span><span class='icon'></span></div>");
		var url = a.href;
		link.replaceWith(playerHolder);
		players.push(playerHolder);
		playerHolder.click(
			function(e)
			{
				if($(this).find(".skin").length) return;
				var playIcon = $(this).find(".icon");
				playIcon.css("position", "relative");
				playIcon.animate({left:"32px", top:"-17px"}, "normal");
				$(this).animate({width:"145px"}, "normal", function(){
					var oldPlayer = $(element).find(".playerHolder");
					if(oldPlayer.length)
					{
						var oldIcon = oldPlayer.prev().find(".icon");
						oldIcon.css("background-position", "0 0");
						oldIcon.animate({left:"0", top:"0"}, "normal");
						oldPlayer.prev().animate({width:"105px"});
						oldPlayer.prev().show();
						oldPlayer.remove();
					}
					playerHolder.hide();
					playIcon.parent().after(oldPlayer.length ? oldPlayer : "<div class='playerHolder'></div>");
					mp3Player.addSkinTo($(element).find(".playerHolder"), url);
					mp3Player.skin.hide();
					mp3Player.skin.fadeIn("normal");
					if(oldPlayer.length) mp3Player.bindUserEvents();
					playIcon.css("background-position", "0 -62px");});
					
			}
		);
	}
	
	function createPlayer(){
		var s = '<div  id="mp3flashplayer" class="mp3player">';
		if(!$.browser.msie)
			s += '<embed id="MP3Player" src="' + args.player + '" allowScriptAccess="always" width="1" height="1" type="application/x-shockwave-flash"></embed>';
		else
			s += '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="1" height="1" id="MP3Player">'
				+'<param name="movie" value="' + args.player + '"/>'
				+'<param name="allowScriptAccess" value="always"/>'
			+'</object>';
		
		s += '<div class="skin player">'
			+'<span class="play-button"></span>'
			+'<span class="label">Pausar</span>'
			+'<span class="total-time"></span>'
			+'<span class="current-time"></span>'
			+'<div class="slider">'
			+'<div class="track"></div>'
			+'<span class="pin"></span>'
			+'</div> '
			+'</div>'
			+'</div>';
		
		var mp3PlayerElement = $(s);
		$(document.body).append(mp3PlayerElement);
		return new Mp3Player(mp3PlayerElement, {});
	}
	
	$(element).find('a').each(selectMp3Links);
	if(players.length){
		mp3Player = createPlayer();
	}
};

//====================Wiki=====================
Cnec.getRGBColor = function(color){
	if((typeof color) != 'string') return;
	if(color.match(/rgb *\((\d+), *(\d+), *(\d+) *\)/i)) {
		var r = parseInt(RegExp.$1).toString(16);
		var g = parseInt(RegExp.$2).toString(16);
		var b = parseInt(RegExp.$3).toString(16);
		if(r.length < 2) r = '0' + r;
		if(g.length < 2) g = '0' + g;
		if(b.length < 2) b = '0' + b;
		return ('#' + r + g + b).toUpperCase();
	}
	return color.toUpperCase();
	
}




jQuery.fn.wiki = function (e){
	var TITLE = "==";
	var SUBTITLE = "===";
	var BOLD = "**";
	var ITALIC = "//";	
	var STRIKE_THROUGH = "--";
	var UNDERLINE = "__";
	var SUB = "´´";
	var SUP = "^^";
	
	
	function getTextColorAware(node){
		var result = "";
		var nodes = node.contents();
		nodes.each(function()
		{
			var nodeItem = $(this);
			result += nodeItem[0].nodeName == 'SPAN' ? renderSpanColorAware(nodeItem) : nodeItem.text();
		});
		return result;
	}
	
	function renderTitle(node, level){
		return level + getTextColorAware(node) + level + "\r\n";
	}
	
	function renderSpan(node, type){
		if(node.text().match(/^\s*$/)) return node.text();
		return type + node.text() + type;
	}
	
	function renderSpanColorAware(node, type){
		var matches = node[0].className.match(/^color-[a-z\d-]+$/);
		var result = matches ? ("<span class='" + matches[0] + "'>") : "";
		var nodes = node.contents();
		nodes.each(function()
		{
			var nodeItem = $(this);
			result += renderNode(nodeItem);
		});
		return result + (matches ? "</span>" : "");
	}
	
	function renderLink(node){
		var url = node.attr("href");
		var label = node.text();
		return "[" + url + " " + label + "]";
	}
	
	function renderImage(node){
		if(!node.attr('src')) return "";
		if(!node.attr('src').length > 500) return "'Imagem omitida: url muito longa.'";
		if(node.attr('src').match(/http:\/\/i.ytimg.com\/vi\/(.*?)\/0.jpg/))
		{
			return "[[|" + RegExp.$1 + ".youtube]]";
		}
		
		function getAlign(){
			if(node.hasClass("imgright")) return ">";
			if(node.hasClass("imgleft")) return "<";
			if(node.hasClass("imgcenter")) return "|";
			if(node.parent().is("center")) return "|";
			return "";
		}
		
		var src = node.attr('src');
		var alt = node.attr('alt');
		alt = alt ? (" " + alt) : "";
		var align = getAlign();
		return "[[" + align + src + alt + "]]";
	}
	
	function renderEmbed(node){
		var match = node.attr('src').match(/https?:\/\/www.youtube.com\/v\/(.+?)(&|$)/);
		if(!match) return "";
		return "[[|" + RegExp.$1 + ".youtube]]";
	}
	
	function renderList(node){
		var isOrdered = node.parent().is('ol');
		
		var result = isOrdered ? "# " : "* ";
		var nodes = node.contents();
		nodes.each(function()
		{
			var nodeItem = $(this);
			result += renderNode(nodeItem);
		});
		return result + "\n";
	}
	
	function renderNode(node){
		if(!node || !node.length) return "";
		if(node[0].nodeType == 3) return node.text().replace(/^\s+$/gm, "");
		switch(node[0].nodeName){
			case "H1":
			case "H2":
				return renderTitle(node, TITLE);
			case "H3":
			case "H4":
			case "H5":
				return renderTitle(node, SUBTITLE);
			case "A":
				return renderLink(node);
			case "B":
			case "STRONG":
				return renderSpan(node, BOLD);
			case "I":
			case "EM":
				return renderSpan(node, ITALIC);	
			case "U":
				return renderSpan(node, UNDERLINE);
			case "SUB":
				return renderSpan(node, SUB);
			case "SUP":
				return renderSpan(node, SUP);
			case "IMG":
				return renderImage(node);
			case "EMBED":
				return renderEmbed(node);	
			case "LI":
				return renderList(node);
			case "SPAN":
				return renderSpanColorAware(node);
			default:
				var result = "";
				var nodes = node.contents();
				nodes.each(function()
				{
					var nodeItem = $(this);
					result += renderNode(nodeItem);
				});
				return result.replace(/^\s+|\s+$/mg, "\n") + "\n\n";
		}
	}
	
	function fixFontElements(element){
		var colorClasses = $("#colorMenu span");
		var colorClassTable = {};
		colorClasses.each(function(index, element){
			if(element.className == 'nocolor') return;
			colorClassTable[Cnec.getRGBColor($(element).css("background-color"))] = element.className;
		});
		
		var fontElements = element.find('font');
		fontElements.each(function(index, fontElement){
			if(!fontElement.color) return;
			var color = Cnec.getRGBColor($(fontElement).css("color"));
			if(colorClassTable[color]){
				$(fontElement).replaceWith("<span class='color-" + colorClassTable[color] + "'>" + $(fontElement).html() + "</span>");
			}
		});
		return element;
	}
	
	var wikiText = renderNode(fixFontElements($(this[0])));
	return wikiText.replace(/\u201c|\u201d/g, '"').replace(/\u2013/g, '-');
};


function TagMenu(element, args){
	function createTagMenu(tags){
		var html = "<div class='tag-menu-options'>";
		for(var i=0; i < tags.length; i++){
			html += "<label class='option'><input type='checkbox' value='" + tags[i] + "' /> " + tags[i] + "</label>";	
		}
		html +="</div>";
		return html;
	}
	
	element = $(element);
	var tags = args.tags.split(/ *, */);
	var menuControl = $('<div class="tag-menu"><span class="arrow"></span><label></label></div>');
	var menu = $(createTagMenu(tags));
	var checkBoxes = menu.find("[type=checkbox]"); 
		
	function updateValue(){
		var checkedBoxes = menu.find("[type=checkbox]:checked");
		var value = "";
		for(var i=0; i<checkedBoxes.length; i++){
			var box = checkedBoxes.eq(i);
			value += box.val() + ", ";
		}
		value = value.replace(/, $/, "");
		var label = menuControl.find('label');
		label.html(value ? value : args.hint);
		label.attr("title", value ? value : '');
		(value) ? menuControl.removeClass("empty") : menuControl.addClass("empty");
		element.val(value);
		while(label[0].scrollHeight > label.height() + 10){
			value = value.replace(/.$/, "");
			label.html(value + "...");
		}
		
	}
	
	function hideOnClick(e){
		var a = $(e.target).parentsUntil(".tag-menu-options");
		if(!a.last().is("html")) return;
		hideMenu();
	}
	
	function showMenu(){
		if(menu.css('display') != 'none')
		{
			hideMenu();
			return;
		}
		menu.show();
		menu.position({of:menuControl, at:"left bottom", my:"left top",  offset:"0 -1px;"});
		menu.hide();
		menu.fadeIn("normal", function(){$(document).click(hideOnClick);});
	}
	
	function hideMenu(){
		$(document).unbind('click', hideOnClick);
		menu.hide();
	}
	
	function setValue(value){
		checkBoxes.removeAttr("checked");
		var tags = value.split(/ *, */);
		for(var i=0; i < tags.length; i++){
			var tag = tags[i];
			var checkbox = checkBoxes.filter("[value='" + tag +"']");
			if(checkbox.length) {
				checkbox.attr("checked", true);
			}
		}
	}
	
	checkBoxes.click(updateValue);
	menuControl.click(showMenu);
	
	element.after(menu).after(menuControl);
	setValue(element.val());
	updateValue();
	element[0].tagMenu = {
			"setValue" : function(value) { 
				element.val(value);
				setValue(value);
				updateValue();
			}
	}
}

//-------------------DynamicSuggetionBox------------------------------
function DynamicSuggetionBox(url, textField)
{
	var me = {};
	var selectedIndex = 0;
	var skipHide = false;
	var listContainer = $("<ul class='suggestionBox'></ul>");
	var oldSearchTerm = "";
	textField.after(listContainer);
	
	function hide()
	{
		if(skipHide){
			skipHide = false;
			return;
		}
		if(!listContainer.is(":hidden"))
			listContainer.fadeOut("normal");
		listContainer.find("li.selected").removeClass("selected");
	}
	me.hide = hide;
	me.listContainer = listContainer;
	
	function show()
	{
		listContainer.stop(true, true);
		listContainer.fadeIn("normal");
		listContainer.position(
			{
			'my': "left top",
			'at': "left bottom",
			'of': textField,
			"collision": 'none'
			}
		);
	}
	
	function fixItemVisibility(item)
	{
		
		var scrollTo = listContainer.scrollTop() + item.position().top;
		listContainer.stop(true);
		listContainer.animate({scrollTop:  scrollTo - 200}, "normal");
		return item;
	}
	
	function selectNext()
	{
		var visibleItems = listContainer.find("li:visible");
		if(visibleItems.length == 0) return;
		var selected = listContainer.find("li.selected");
		if(selected.length == 0)
		{
			selectedIndex = 0;
			selected = visibleItems.eq(0);
			selected.addClass("selected");
			fixItemVisibility(selected);
			return selected;
		}
		if((selectedIndex + 1) < visibleItems.length) selectedIndex++;
		
		selected.removeClass("selected");
		selected = visibleItems.eq(selectedIndex);
		selected.addClass("selected");
		fixItemVisibility(selected);
		return selected;
	}
	
	function selectPrevious()
	{
		var visibleItems = listContainer.find("li:visible");
		if(visibleItems.length == 0) return;
		var selected = listContainer.find("li.selected");
		if(selected.length == 0)
		{
			selectedIndex = 0;
			selected = visibleItems.eq(0);
			selected.addClass("selected");
			return selected;
		}
		if(selectedIndex > 0) selectedIndex--;
		
		selected.removeClass("selected");
		selected = visibleItems.eq(selectedIndex);
		selected.addClass("selected");
		fixItemVisibility(selected);
		return selected;
	}
	
	function onResult(result)
	{
		listContainer.html(result);
		listContainer.find("li").click(select);
		show();
	}
	
	function onError(result)
	{
		listContainer.html('');
		hide();
	}
	
	function filter(searchTerm)
	{
		if(oldSearchTerm == searchTerm) return;
		
		$.ajax(url,
			{
		        data: {search: searchTerm},
		        type: "POST",
		        dataType: "text",
		        contentType: "application/x-www-form-urlencoded;charset=ISO-8859-15",
		        success: onResult,
		        error: onError,
			}
		);
		oldSearchTerm = searchTerm;
	}
	
	function onKeyUp(e)
	{
		if(e.keyCode == 13) return;
		var searchTerm = textField.val();
		if(searchTerm.length < 3)
		{
		 	hide();
		 	return;
		}
		filter(searchTerm);
	}
	
	function onKeyDown(e)
	{
		if(e.keyCode == 40)
		{
			selectNext();
			return false;
		}
		if(e.keyCode == 38)
		{
			selectPrevious();
			return false;
		}
		if(e.keyCode == 13)
		{
			var selected = listContainer.find("li.selected");
			if(selected.length == 0) return false;
			var event = $.Event("itemSelect", {selected: selected});
			$(me).triggerHandler(event);
			return false;
		}	
	}
	
	function select()
	{
		var selected = $(this);
		listContainer.find("li.selected").removeClass('selected');
		selected.addClass("selected");
		var event = $.Event("itemSelect", {selected: selected});
		$(me).triggerHandler(event);
	}
	
	textField.bind("keyup", onKeyUp);
	textField.bind("keypress", onKeyDown);
	textField.bind("blur", hide);
	listContainer.bind("mousedown", function(){skipHide = true;});
	listContainer.bind("blur", hide);
	listContainer.bind("keypress", onKeyDown);
	return me;
}

//---------------   change class over document scroll   --------------------------------------
jQuery.fn.changeClassOverDocumentScroll = function(options){
	var $ = jQuery;
	options = $.extend({className:"scrolled", scrollTop:500}, options);
	function initialize(){
		var element = $(this);
		function scroll(){
			var currentTop = $(document).scrollTop();
			isScrolled = currentTop > options.scrollTop;
			if(isScrolled)
				element.addClass(options.className);
			else
				element.removeClass(options.className);
		}
		$(document).scroll(scroll);
		scroll();
	}
	return this.each(initialize);
};	

Cnec.Tooltip = function(element, args)
{
	this.tooltip = element.title;
	element.title = "";
	this.my = "left top";
	this.at = "left bottom";
	this.offset = "15px 0px";
	this.element = $(element);
	this.element.hover(Cnec.bindfn(this.over, this), Cnec.bindfn(this.out, this));
};

Cnec.Tooltip.prototype.over = function(e)
{
	this.element.parent().append("<span class='tooltip'><i></i><span>" + this.tooltip + "</span></span>");
	this.tooltipElement = this.element.parent().find(".tooltip:last-child"); 
	this.tooltipElement.position({
		  "my": this.my,
		  "at": this.at,
		  "of": this.element,
		  "offset": this.offset
		});
};

Cnec.Tooltip.prototype.out = function(e)
{
	this.tooltipElement.remove(); 
};

Cnec.notification = function(message, styleName, timeOut) {
	var notification = $("<div class='ns-box " + styleName + "'><div class='ns-box-inner'><span class='icon'></span><p>" + message + "</p></div><span class='ns-close'>X</span></div>");
	var timeOutHandle = 0; 
	
	function close() {
		if(timeOutHandle) clearTimeout(timeOutHandle);
		notification.remove();
	}
	
	$(".ns-close", notification).click(close);
	$('body').append(notification);
	
	var me = {close:close, element: notification};
	if(!timeOut) return me;
	timeOutHandle = setTimeout(function() {notification.remove();}, timeOut);
	return me;
};

Cnec.alert = function(info){
	info = $.extend({
		kind: "info",
		message: "",
		title: "Atenção",
		buttons: ["Ok"],
		callback : null,
		zIndex: 8,
		params : null
	}, info); 

	bg = $(Cnec.darken());
	
	var buttons = "";
	$(info.buttons).each(function(){buttons += Cnec.format("<a>%s</a>", this);});
	
	var html = Cnec.format("<div class='alert-box %s'>" +
	"<h4>%s</h4>" +
	"<p class='message'>%s</p>" +
	"<div class='buttons'>%s</div>" +
	"</div>", info.kind, info.title, info.message, buttons);
	html = $(html);
	buttons = $(".buttons a", html);
	buttons.click(function(){
		var button = $(this).index();
		html.addClass("hidden");
		bg.animate({"opacity":  0}, "fast", function(){
			html.remove();
			bg.remove();
			if(info.callback) info.callback(button, info.params);
		});
		html.addClass("hidden");
	});
	bg.css("opacity", 0);
	bg.css("zIndex", info.zIndex);
	html.css("zIndex", info.zIndex);
	bg.animate({"opacity":  .5}, "fast", function(){
		$("body").append(html);
		html.placeAtCenter();
		html.addClass("shown");
	});
	
}


Cnec.format = function(message){
	var args = $.makeArray(arguments); 
	args.shift();
	function replace(matches){
		var value = args.shift();
		if(value == null) return '';
		return value.toString();
	}
	return message.replace(/%s/g, replace);
};

Cnec.jsonRequest = function (url, options){
	options = $.extend({
		url: url,
		dataType:"json",
		type: "POST",
		"contentType": "application/x-www-form-urlencoded; charset=UTF-8"
	}, options);
	$.ajax(options);	
};

(function($){
	function format(message){
		var args = $.makeArray(arguments); 
		args.shift();
		function replace(matches){
			var value = args.shift();
			if(value == null) return '';
			return value.toString();
		}
		return message.replace(/%s/g, replace);
	}
	
	function pageHeight(){
		return Math.max(document.documentElement.scrollHeight, document.documentElement.offsetHeight - document.documentElement.scrollTop);
	}
	
	$.fn.placeAtCenter = function(){
		var e = $(this); 
		var w = $(window);
		var x = Math.max(0, ((w.width() - e.outerWidth()) / 2) + w.scrollLeft());
		var y = Math.max(0, ((w.height() / 2 - e.outerHeight() / 2) + w.scrollTop()));
		
		e.css("position","absolute");
		e.css("top",  Math.round(y) + "px");
		e.css("left", Math.round(x)  + "px");
		return this;
	}
	
	$.fn.center = $.fn.placeAtCenter;
	
	$.fn.enumSet = function(){
		if(this.length == 0) return this;
		var element = $(this);
		if(!element.data("enum")) return this;
		var value = parseInt(element.val());
		var items = element.data("enum").split(/ *, */);
		var html = '<ul class="enum-set-checkboxes">'
		for(var i = 0; i < items.length; i++){
			var li = format('<li><label><input type="checkbox" value="%s" %s> %s</label></li>', 1 << i, (value & (1 << i)) ?  'checked="checked"' : '', items[i]);
			html += li;
		}
		
		var checkboxes = $(html);
		element.after(checkboxes);
		
		function onChange(){
			var selected = checkboxes.find("input:checked");
			var value = 0;
			selected.each(function(){
				value |= parseInt($(this).val());
			})
			element.val(value);
		}
		
		checkboxes.find("input").click(onChange);
		return this;
	}
}(jQuery));