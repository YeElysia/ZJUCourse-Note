import sys
from PyQt5 import QtWidgets
from PyQt5 import QtCore
from PyQt5.QtGui import QImage, QPixmap
import cv2

app = QtWidgetps.QApplication(sys.argv)
label = QtWidgets.QLabel("Hello world!")

# windows resize


img = cv2.imread("/home/yee/elysiam/Typst/classify-gradio/image-2.png")
if img is not None:
    height, width, channel = img.shape
    bytes_per_line = 3 * width
    qimg = QImage(img.data, width, height, bytes_per_line, QImage.Format_RGB888)
    label.setPixmap(QPixmap.fromImage(qimg))
else:
    print("Image not found or could not be loaded.")
label.setWindowTitle("PyQt5 Image Display")
label.resize(800, 800)
label.setStyleSheet("background-color: white;")

label.show()
sys.exit(app.exec_())
