# 加载pth导出为onnx
import torch
import torch.onnx
import torchvision.models as models
import os
import argparse
from models.cnn import ResNet18
def export_model_to_onnx(model, input_size, output_path):
    """导出模型为ONNX格式"""
    dummy_input = torch.randn(1, *input_size)
    torch.onnx.export(model, dummy_input, output_path, export_params=True,
                      opset_version=11, do_constant_folding=True,
                      input_names=['input'], output_names=['output'],
                      dynamic_axes={'input': {0: 'batch_size'}, 'output': {0: 'batch_size'}})
    print(f"Model exported to {output_path}")


# 加载本地模型 Resnext_best.pth


model = ResNet18()
model.load_state_dict(torch.load("/home/yee/elysiam/python/lab5/deep_mlpck/ResNet_best.pth"))
# 检查参数是否加载成功
model.eval()
dummy_input = torch.randn(1, 3, 32, 32)  # 示例输入（MNIST尺寸）
output = model(dummy_input)
print(output.shape)  # 应输出 torch.Size([1, 10])

onnx_model = torch.onnx.export(
    model,                      # PyTorch 模型
    dummy_input,                # 示例输入
    "resnet18.onnx",          # 输出 ONNX 文件名
    input_names=["input"],      # 输入名称（可选）
    output_names=["output"],    # 输出名称（可选）
    dynamic_axes={              # 动态轴（支持可变 batch_size）
        "input": {0: "batch_size"},
        "output": {0: "batch_size"},
    },
    opset_version=13,           # ONNX 算子集版本（推荐 11+）
)

torch.save(onnx_model,f"mdoel_resnet18_50epoch.onnx")