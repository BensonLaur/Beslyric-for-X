// https://stackoverflow.com/questions/25105269/silent-install-qt-run-installer-on-ubuntu-server
// https://doc.qt.io/qtinstallerframework/noninteractive.html
// https://bugreports.qt.io/browse/QTIFW-166
// https://doc.qt.io/qtinstallerframework/ifw-use-cases-cli.html#unattended-usage
// https://doc.qt.io/qtinstallerframework/ifw-cli.html
// https://forum.qt.io/topic/79353/how-to-execute-an-installer-silently-qt-framework-installer
// https://stackoverflow.com/questions/44024812/how-to-launch-my-qt-installer-in-silent-mode-qt-installer-framework
//
// & .\Installer.exe --script .\qt-installer-noninteractive.qs --verbose targetDirectory='C:\somewhere'
//


function Controller() {
    installer.autoRejectMessageBoxes();
    installer.installationFinished.connect(function () {
        gui.clickButton(buttons.NextButton);
    })
}

Controller.prototype.IntroductionPageCallback = function () {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.WelcomePageCallback = function () {
    // click delay here because the next button is initially disabled for ~1 second
    gui.clickButton(buttons.NextButton, 3000);
}

Controller.prototype.TargetDirectoryPageCallback = function () {
    gui.currentPageWidget().TargetDirectoryLineEdit.setText(installer.value("targetDirectory"));
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ComponentSelectionPageCallback = function () {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.StartMenuDirectoryPageCallback = function () {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function () {
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.FinishedPageCallback = function () {
    gui.clickButton(buttons.FinishButton);
}
