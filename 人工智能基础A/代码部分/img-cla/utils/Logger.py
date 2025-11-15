import os
import logging

from datetime import datetime

debug_info = True  # 是否开启debug模式
LOG_DIR = os.path.join(os.path.dirname(__file__), 'logs')  # 日志文件夹路径

# log
logger = logging.getLogger('logger')
if debug_info:
    logger.setLevel(logging.DEBUG)
else:
    logger.setLevel(logging.INFO)
formator = logging.Formatter(fmt="%(asctime)s [ %(filename)s ]  %(lineno)d行 | [ %(levelname)s ] | [%(message)s]", datefmt="%Y/%m/%d/%X")
sh = logging.StreamHandler()  # 创建一个输出的处理器，让它输入到控制台
sh.setLevel(logging.DEBUG)  # 设置输出的级别
if not os.path.exists(LOG_DIR):
    os.mkdir(LOG_DIR)
log_name_appendex = "{0}.txt".format(datetime.now().strftime('%Y-%m-%d %H-%M-%S'))
filename = os.path.join(LOG_DIR, log_name_appendex)
fh = logging.FileHandler(filename, encoding="utf-8")  # 创建一个把日志信息存储到文件中的处理器
logger.addHandler(sh)  # 把输出处理器添加到日志器中
sh.setFormatter(formator)
logger.addHandler(fh)  # 把文件处理器，加载到logger中
fh.setFormatter(formator)  # 给文件处理器添加格式器
logger.debug('debug_log_test')
logger.info('info_log_test')
logger.warning('warning_log_test')
logger.error('error_log_test')
logger.critical('critical_log_test')