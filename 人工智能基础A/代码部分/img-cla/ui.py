import gradio as gr
import time
import modelscope_studio.components.antd as antd
import modelscope_studio.components.base as ms
from main import Trainer
import os
import torch
from net.resnet import ResNet18
import albumentations as A
from albumentations.pytorch import ToTensorV2
import cv2
import matplotlib.pyplot as plt
import numpy as np

# plt.rcParams['font.sans-serif'] = ['SimHei']  # Windows 黑体
# plt.rcParams['font.sans-serif'] = ['Arial Unicode MS']  # macOS
plt.rcParams['font.sans-serif'] = ['Noto Sans CJK JP']  # Linux

classes = ['僵蚕', '党参', '天南星', '枸杞', '槐花', '牛蒡子', '牡丹皮', '猪苓', '甘草', '百合',
                   '百部', '竹叶', '竹茹', '紫草', '红藤', '艾叶', '荆芥', '金银花', '黄柏', '黄芪']

theme = gr.themes.Soft(
    primary_hue="rose",
    secondary_hue="gray"
)

# 耗时处理函数
def process(image, progress=gr.Progress()):

    print(image)
    input_img = cv2.imread(image.name)  # 读取上传的图片
    input_img = cv2.cvtColor(input_img, cv2.COLOR_BGR2RGB)  # 转换为RGB格式
    input_img = np.array(input_img)  # 转换为NumPy数组

    

    def load_model():
        # 加载模型 models 文件夹下最新的 'models/best{0}.pth'.format(datetime.now().strftime('%Y-%m-%d %H-%M-%S') 文件


        best_model = None
        max_order = -1
        if not os.path.exists("models"):
            raise FileNotFoundError("模型文件夹 'models' 不存在，请先训练模型。")
        for f in os.listdir("models"):
            print(f)
            _ , order, _= f.split('__')
            order = int(order)
            if order > max_order:
                max_order = order
                best_model = f
        if best_model is None:
            raise FileNotFoundError("没有找到可用的模型文件，请先训练模型。")
        model_path = os.path.join("models", best_model)

        return model_path
    
    def plot_bar_chart(data):
            # 确保 probabilities 是 numpy 数组
        if isinstance(data, torch.Tensor):
            data = data.detach().cpu().numpy()[0]  # 转 numpy


        
    
        # print("绘制柱状图，数据：", data)
        plt.figure(figsize=(10, 6))
        plt.bar(x=[classes[i] for i in range(len(classes))], height=list(data))
        plt.xlabel("Classes")
        plt.ylabel("Probabilities")
        plt.xticks(rotation=45)

        return plt
        


    # 初始状态：仅更新状态文本和结果可见性，进度条已经可见且为0
    yield {
        progress_status_text: gr.update(value="初始化中...", visible=True),
        output: gr.update(value="", visible=False) # 处理开始时隐藏结果
    }

    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    model = ResNet18(NUM_CLASSES=20).to(device)
    weight = torch.load(load_model(),map_location=device)
    model.load_state_dict(weight['model_state_dict'])
    if not isinstance(model, torch.nn.Module):
        raise TypeError("加载的模型不是有效的 PyTorch 模型，请检查模型文件。")
    
    transform = A.Compose([
        A.Resize(height=224, width=224),
        A.Normalize(mean=(0.485, 0.456, 0.406), std=(0.229, 0.224, 0.225)),
        ToTensorV2(),
    ])

    input_tensor = transform(image=input_img)["image"].unsqueeze(0)  # 添加batch维度

    with torch.no_grad():
        outputs = model(input_tensor.to(device))
        _, preds = torch.max(outputs, 1)
    probabilities = torch.nn.functional.softmax(outputs, dim=1)
    top5_prob, top5_catid = torch.topk(probabilities, 5)
    print("Top 5 probabilities:", top5_prob)
    print("Top 5 categories:", top5_catid)
    result_text = "识别结果：\n"
    for i in range(top5_prob.size(1)):
        result_text += f"类别 {classes[int(top5_catid[0][i].item())]} - 概率: {top5_prob[0][i].item():.4f}\n"

    plot = plot_bar_chart(probabilities)


    # 最终状态：重置进度条为0，隐藏状态文本，显示最终结果
    yield {
        progress_bar: gr.update(percent=0, status='success'), # 识别完成后，状态设为success，百分比回到0
        progress_status_text: gr.update(value="", visible=False), # 完成后隐藏并清空状态文本
        output: gr.update(value=result_text, visible=True),
        output_image: gr.update(value=plot)  # 显示结果图
    }

    # 函数的最终返回值，会被传递给 generate.click 的最终输出
    return result_text, plot  # 返回最终结果，用于更新 output 组件

def run_trainer(epochs, batch_size, train_mode, criterion, optimizer, learning_rate, weight_decay, scheduler, step_size, gamma):
    data_dir = '/home/yee/.fiz/courseware/人工智能基础（A）/中药数据集'
    classes =  {0: '僵蚕', 1: '党参', 2: '天南星', 3: '枸杞', 4: '槐花', 5: '牛蒡子', 6: '牡丹皮', 7: '猪苓', 8: '甘草', 9: '百合', 10: '百部', 11: '竹叶', 12: '竹茹', 13: '紫草', 14: '红藤', 15: '艾叶', 16: '荆芥', 17: '金银花', 18: '黄柏', 19: '黄芪'}

    trainer = Trainer(
        dataset=data_dir,
        classes=classes,
        num_classes=20,
        epochs=epochs,
        batch_size=batch_size,
        model=train_mode,
        criterion=criterion,
        optimizer=optimizer,
        learning_rate=learning_rate,
        weight_decay=weight_decay,
        scheduler=scheduler,
        step_size=step_size,
        gamma=gamma
    )
    trainer.train()

    with open("evaluation_results.txt", "r") as f:
        results = f.read()
        _output1 = results.splitlines()[0] if len(results.splitlines()) > 0 else "0.0"
        _output2 = results.splitlines()[1] if len(results.splitlines()) > 1 else "0.0"   
        _output3 = results.splitlines()[2] if len(results.splitlines()) > 2 else "0.0"
        _output4 = results.splitlines()[3] if len(results.splitlines()) > 3 else "0.0"
    
    roc = "Multiclass ROC Curve.png" 

    return _output1, _output2, _output3, _output4, roc


with gr.Blocks(theme=theme, title="图像分类识别") as demo:
    with ms.Application():
        with antd.ConfigProvider():
            with ms.Div(elem_id="user-profile-container"):
                with antd.Avatar(size=40):
                    with ms.Slot("icon"):
                        antd.Icon("UserOutlined")
                ms.Text("用户0721", elem_id="username-text")

    # ===== 标题区 =====
    gr.HTML("""
    <div style="text-align:center">
        <h1 style="color:#ff69b4">图像分类识别 =v= </h1>
        <p style="color:#666">✨↓请选择上传文件↓✨</p>
    </div>
    """)

    # --- 将所有功能区放入 Tabs 中 ---
    with gr.Tabs():
       # ===== 主界面 Tab =====
        with gr.Tab(label="主界面"):

            # ===== 操作区 =====
            with gr.Row(equal_height=True):
                upload = gr.UploadButton(
                    "📁 上传文件 (UPLOAD)",
                    file_types=["image", "video"],
                    variant="secondary"
                )
                generate = gr.Button(
                    "🚀 开始识别 (Generate)",
                    variant="primary"
                )

            # ===== 预览区 =====
            with gr.Accordion(" 文件预览", open=True):
                preview = gr.Image(label="图片预览", visible=False)
            # ===== 进度条和状态显示区 =====
            with gr.Column(variant="panel"):
                gr.Markdown("## 识别进度")
                with antd.ConfigProvider():
                    progress_bar = antd.Progress(
                        percent=0,
                        visible=True,
                        status='normal',
                        show_info=True
                    )
                    progress_status_text = gr.Textbox(
                        label="当前状态",
                        interactive=False,
                        value="未开始识别",
                        visible=True
                    )

            # ===== 结果区 =====
            with gr.Row(equal_height=True):
                with gr.Column(variant="panel"):
                    gr.Markdown("## 识别结果")
                    output = gr.Textbox(
                        label="分析结果",
                        lines=10,
                        interactive=False,
                        visible=True,
                        value="请上传文件并点击 '开始识别' 获取结果。"
                    )
                with gr.Column(variant="panel"):
                    gr.Markdown("## 识别结果图")
                    output_image = gr.Plot()
            # ===== 交互逻辑 =====
            upload.upload(
                lambda f, t: {
                    preview: gr.Image(visible=True, value=f),
                    output: gr.update(value="请点击 '开始识别' 获取结果。", visible=True),
                    progress_bar: gr.update(percent=0, status='normal'),
                    progress_status_text: gr.update(value="未开始识别", visible=True)
                },
                [upload],
                [preview, output, progress_bar, progress_status_text]
            )

            generate.click(
                process,
                [upload],
                [progress_bar, progress_status_text, output, output_image]
            )

        # ===== 参数控制 Tab =====
        with gr.Tab(label="参数控制"):
            gr.Markdown("## 训练参数设置（Train settings）")

            epochs = gr.Slider(
                minimum=1,
                maximum=100,
                value=20,
                step=1,
                label="epochs",
                info="模型完整遍历训练数据集的次数。",
                interactive = True
            )

            batch_size = gr.Slider(
                minimum=1,
                maximum=100,
                value=10,
                step=1,
                label="Batch size",
                info="单次训练迭代中使用的样本数量。",
                interactive=True
            )

            gr.Markdown("## 模式设置（model settings）")
            train_mode = gr.Dropdown(
                ["YOLO_CLA","ResNet","MobileNetV2"],
                label="model",
                info="选择你想使用的训练模型。",
                interactive=True
            )

            gr.Markdown("## 标准设置（criterion settings）")
            criterion = gr.Dropdown(
                ["CrossEntropyLoss", "BCELoss"],
                label="criterion",
                info="选择你想使用的训练标准。",
                interactive=True
            )

            gr.Markdown("## 优化器设置（optimizer settings）")
            optimizer = gr.Dropdown(
                ["AdamW", "SGD"],
                label="optimizer",
                info="选择你想使用的优化器。",
                interactive=True
            )
            learning_rate = gr.Slider(
                minimum=0.001,
                maximum=0.01,
                value=0.001,
                step=0.001,
                label="Learning rate",
                info="学习率。",
                interactive=True
            )
            weight_decay = gr.Slider(
                minimum=0.001,
                maximum=0.01,
                value=0.001,
                step=0.001,
                label="Weight decay",
                info="权重衰减。",
                interactive=True
            )

            gr.Markdown("## 任务调度器设置（scheduler settings）")
            scheduler = gr.Dropdown(
                ["StepLR", "CosineAnnealingLR"],
                label="scheduler",
                info="选择你想使用的任务调度器。",
                interactive=True
            )
            step_size = gr.Slider(
                minimum=1,
                maximum=10,
                value=5,
                step=1,
                label="Step size",
                info="步长。",
                interactive=True
            )
            gamma = gr.Slider(
                minimum=0.01,
                maximum=0.1,
                value=0.01,
                step=0.01,
                label="Gamma",
                info="调整正则化项的权重,以控制模型复杂度。",
                interactive=True
            )
            train = gr.Button(
                    "开始训练 (Train)",
                    variant="primary"
                )
            
            # ===== 结果区 ===== 、、召回率、F1 分数、ROC 曲线
            with gr.Column(variant="panel"):
                gr.Markdown("## 训练结果")
                output1 = gr.Textbox(
                    label="准确率",
                    lines=1,
                    interactive=False,
                    visible=True,
                    value="0.0",
                )
                output2 = gr.Textbox(
                    label="精确率",
                    lines=1,
                    interactive=False,
                    visible=True,
                    value="0.0",
                )
                output3 = gr.Textbox(
                    label="召回率",
                    lines=1,
                    interactive=False,
                    visible=True,
                    value="0.0",
                )
                output4 = gr.Textbox(
                    label="F1 分数",
                    lines=1,
                    interactive=False,
                    visible=True,
                    value="0.0",
                )
            
            output5 = gr.Image(
                    label="ROC 曲线",
                    value="None",
                )


            # ===== 交互逻辑 =====

            train.click(
                run_trainer,
                [epochs, batch_size, train_mode, criterion, optimizer, learning_rate, weight_decay, scheduler, step_size, gamma],
                [output1, output2, output3, output4, output5]
            )


    # --- 浮动按钮不受 Tab 影响，依然在最外层 ---
    with ms.Application():
        with antd.ConfigProvider():
            with antd.FloatButton.Group(shape="circle",
                                        elem_style=dict(insetInlineEnd=24, bottom=24)):
                with antd.FloatButton(tooltip="点击获取帮助"):
                    antd.Icon("QuestionCircleOutlined")
                antd.FloatButton.BackTop(visibility_height=0)

if __name__ == "__main__":
    demo.launch()