"use strict"

this.angular.module "angularSlider", []
	# inner wrapper
	.service "slClickHelper", () ->
		return 
	.directive "slCellWrapper", [
		() ->
			link = (scope, element, attrs) ->
				element.css
					width: "10000px"
					listStyle: "none"
					transition: "all 1s"
				return
			link: link
	]
	# outter wrapper
	.directive "slCellRoot", [
		() ->
			link = (scope, element, attrs) ->
				element.css
					height: "235px"
					width: "600px"
					overflow: "hidden"
					margin: "0 auto"
				return
			link: link
			replace: true
	]
	# cell
	.directive "slCellTemp", [
		() -> 
			link = (scope, element, attrs) ->
				element.css
					height: "235px"
					float:"left"
				return
			link: link
	]
	# .directive "slCellImg", [
	# 	->
	# 		link = (scope, element, attrs) ->
	# 		return
	# 	link: link
	# ]
	.directive "slCell",[
		() ->
			replace = true
			template = '
				<li sl-cell-temp ng-repeat="sl in sliderImgs">
					<img src="{{sl.src}}" alt="{{sl.alt}}">
				</li>
			'
			scope =
				sliderImgs: "="

			template: template
			replace: replace
			scope: scope
	]
	.directive "slBtn", [
		"slClickHelper"
		"$window"
		(slClickHelper, $window) ->
			link = (scope, element, attrs) ->
				element.css
					padding: "6px 15px 9px 15px"
					color: "white"
					fontSize: "15px"
					boxShadow: "none"
					background: "#01E833"
					border: "1px solid #01E833"
					borderRadius: "8px"
					margin: "5px"
					cursor: "pointer"
				if attrs.slBtn is "prev"
					element.on "click",(e) ->
						e.preventDefault()
						console.log e
						return
				else if attrs.slBtn is "next"
					element.on "click",(e) ->
						e.preventDefault()
						console.log e
						return
				return
			link: link
	]
