var app = angular.module('demoapp', ['angularSlider']);

app.controller('ctrl', ['$scope', function($scope){

	$scope.sliderImages = [
		{
			src: "public/images/1.jpg"
		},
		{
			src: "public/images/2.jpg"
		},
		{
			src: "public/images/3.jpg"
		}
	];
	$scope.test = 'this is a test'
}]);
