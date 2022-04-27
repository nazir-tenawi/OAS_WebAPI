

(function () {
    var setupFactory = function ($http) {




        return {
           
            GetAllInputHelpType: getAllInputHelpType,
            SaveInputHelp: saveInputHelp,
            DeleteInputHelp: deleteInputHelp,
            GetInputHelp: getInputHelp
            
        };
    };

    medicareApp.factory('setupFactory', setupFactory);

})();

medicareApp.controller("setupController", ['$scope', '$uibModal', 'setupFactory', 'employeeFactory', function ($scope, $uibModal, setupFactory, employeeFactory) {
    var validateForm = function (group) {
        $scope.ErrorList = [];
        $("." + group).removeClass("invalid-field");
        var notFound = true;
        $("." + group).each(function () {
            if ($(this).hasClass("ng-invalid")) {
                $(this).addClass("invalid-field");
                var message = $(this).parent().prev("label").clone().children().remove().end().text();
                $scope.ErrorList.push({ Message: message + " is required." });
                notFound = false;
            }
        });
        return notFound;
    };
    $scope.ViewEmployee = function (id) {
        $scope.Employee = {};

        if (id > 0) {
            employeeFactory.GetData(id).then(function (response) {
                $scope.Employee = response.data;
            });
        }

        $scope.modalInstance = $uibModal.open({
            templateUrl: '/AttendanceTracking/Employee/Details',
            controller: 'employeeController',
            backdrop: 'static',
            scope: $scope,
            size: 'xl'
        });
    };

    $scope.closeModal = function () {
        $scope.modalInstance.close();
    };

    $scope.deleteMasterData = function (id) {
        $.confirm({
            title: 'Confirmation required',
            content: 'Do you really want to delete?',
            buttons: {
                ok: {
                    action: function () {
                        setupFactory.DeleteInputHelp(id).then(function (response) {
                            if (response.data.Success) {
                                showMessage(response.data.Message, "success");
                                getAllInputHelpData();
                            } else {
                                showMessage(response.data.Message, "error");
                            }
                        });
                    }
                },
                cancel: function () {
                    // nothing to do
                }
            }
        });
    };


    $scope.SaveInputHelp = function () {
        if (validateForm("InputHelp")) {
            setupFactory.SaveInputHelp($scope.InputHelpModel).then(function (response) {
                if (response.data.Success) {
                    showMessage("Saved Sucessfully", "success");
                    $scope.closeModal();
                    $scope.InputHelpModel = {};
                    getAllInputHelpData();
                }
                else {
                    showMessage(response.data.Message, "error");

                }
            });
        }
    };


}]);

