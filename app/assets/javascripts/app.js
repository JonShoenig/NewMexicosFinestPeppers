var app = angular.module('shop', ['ngResource']);
//Workaround to get Angular running
$(document).on('ready page:load', function() {
	angular.bootstrap(document.body, ['shop'])
});
//factory for models
app.factory('models', ['$resource', function($resource){
	var orders_model = $resource("/orders/:id.json", {id: "@id"});
	var products_model = $resource("/products/:id.json", {id: "@id"});
	var x = {
		orders: orders_model,
		products: products_model
	};
	return x;
}]);
//connect app to OrdersCtrl controller
app.controller('OrdersCtrl', ['$scope', 'models', function($scope, models){
	// Here will be all code belonging to this controller
	$scope.orders = models.orders.query();
	$scope.products = models.products.query();
	//add new orders
	$scope.addOrder = function(){
		//only orders with product id or zero total gets added
		if(!$scope.newOrder.product_id || $scope.newOrder.total === ''){ return; }
		//Order can be submitted if product_id and total are filled out
		order = models.orders.save($scope.newOrder, function(){ //POST
			recent_order = models.orders.get({id: order.id});
			$scope.orders.push(recent_order);
			$scope.newOrder = '';
		});
	}
	//delete orders
	$scope.deleteOrder = function(order){
		models.orders.delete(order);
		$scope.orders.splice($scope.orders.indexOf(order), 1);
	};
}]);
