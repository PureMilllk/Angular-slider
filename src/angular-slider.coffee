"use strict"

this.angular.module "angularSlider", []
	# inner wrapper
	.directive "slUl", [
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
				return
			template = '
				<div>
					<ul sl-ul ng-transclude>
					</ul>
				</div>
			'
			link: link
			template: template
			transclude: true
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
	.directive "slBtn", [
		() ->
			link = (scope, element, attrs) ->
				element.css
					padding: "9px"
					color: "white"
					fontSize: "15px"
					boxShadow: "none"
					background: "#01E833"
					border: "1px solid #01E833"
					borderRadius: "8px"
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
