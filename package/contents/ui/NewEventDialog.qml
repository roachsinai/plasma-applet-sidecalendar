import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.components 3.0 as PlasmaComponents3

import "zstyle2" as ZStyle2

PlasmaCore.Dialog {
	id: newEventDialog

	property Item agendaItem: null
	readonly property var dayData: agendaItem ? agendaItem.dayData : null
	visible: false

	onVisibleChanged: {
		if (!visible) {
			agendaItem = null
			main.dialog.requestActivate()
		}
	}

	visualParent: agendaItem ? agendaItem.dayHeading : null

	flags: Qt.WindowStaysOnTopHint
	location: PlasmaCore.Types.RightEdge

	mainItem: FocusScope {
		id: focusScope
		width: dialogLayout.implicitWidth
		height: dialogLayout.implicitHeight
	
		MouseArea {
			id: eventDialogMouseArea
			anchors.fill: parent

			hoverEnabled: true

			ColumnLayout {
				id: dialogLayout

				RowLayout {
					PlasmaComponents3.TextField {
						Layout.fillWidth: true
						Layout.preferredWidth: 300 * units.devicePixelRatio
						text: ""
						placeholderText: i18n("Eg: 9am-5pm Work")
						font.pointSize: -1
						font.pixelSize: 16 * units.devicePixelRatio
					}
					PlasmaComponents3.ToolButton {
						Layout.alignment: Qt.AlignTop
						icon.name: "window-close-symbolic"
						onClicked: newEventDialog.close()
					}
				}

				CalendarSelector {
					id: calendarSelector
				}
			}
		
		}
	}
}
