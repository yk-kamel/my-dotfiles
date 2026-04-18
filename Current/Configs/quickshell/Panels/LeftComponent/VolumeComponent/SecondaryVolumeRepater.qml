import QtQuick
import QtQuick.Layouts
import "../../../Colors.js" as T
import Quickshell.Services.Pipewire
import QtQuick.Controls


ColumnLayout {

	height: content.height
	width: content.width
	anchors.horizontalCenter: parent.horizontalCenter

	PwNodeLinkTracker {
		id: audioAppOutputTracker
		node: Pipewire.defaultAudioSink
	}

	Repeater {
		model: audioAppOutputTracker.linkGroups
        	Rectangle {
        		color: "transparent"
        		height: 30
        		width: 30
        		anchors.horizontalCenter: parent.horizontalCenter
        		PwObjectTracker {
				objects: [ modelData.source ]
			}
			Text {
				text: modelData.source.audio.muted ? ""
				: (Math.round(modelData.source.audio.volume *100) >= 50)  ? ""
				: (Math.round(modelData.source.audio.volume *100) >= 25)  ? ""
				: ""
				anchors.verticalCenter: parent.verticalCenter
				anchors.left: parent.left
				anchors.leftMargin: 7
				color: T.c.Accent1
				font.family: "Terminess Nerd Font"
			}
        		MouseArea {
        			anchors.fill: parent
				hoverEnabled: true
				cursorShape: Qt.PointingHandCursor
				onClicked: {
					if (modelData.source && modelData.source.audio) {
                        			modelData.source.audio.muted = !modelData.source.audio.muted
                        		}
                        	}


				ToolTip {
					visible: parent.containsMouse
					text: modelData.source.properties["media.name"] + ":	" + Math.round(modelData.source.audio.volume * 100) + "%"
					delay: 500
					font.family: "Terminess Nerd Font"
				}
				onWheel: (wheel)=> {
        				modelData.source.audio.volume = modelData.source.audio.volume + ( 0.05 * wheel.angleDelta.y/120)
    				}

        		}


        	}

	}
}