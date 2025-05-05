# 使用 ubuntu:22.04 作为基础镜像
FROM ubuntu:22.04

# 设置非交互式前端，避免 apt-get 提问
ENV DEBIAN_FRONTEND=noninteractive

# 设置工作目录
WORKDIR /app

# 更新包列表并安装 wget, unzip 和 ca-certificates，然后下载、解压、设置权限并清理
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget unzip ca-certificates && \
    # 下载指定版本的 fuclaude 压缩包
    wget -O fuclaude.zip https://github.com/wozulong/fuclaude/releases/download/v0.3.9/fuclaude-v0.3.9-linux-amd64-cb5c08c.zip && \
    # 使用密码解压压缩包到当前目录 (/app)
    unzip -P linux.do fuclaude.zip && \
    # 删除不再需要的压缩包
    rm fuclaude.zip && \
    # 给 fuclaude 添加可执行权限
    chmod +x fuclaude && \
    # 给 config.json 添加读写权限 (666)
    chmod 666 config.json && \
    # 清理 apt 缓存，减小镜像体积
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# (可选) 如果你需要暴露端口，可以在这里添加 EXPOSE 指令
# EXPOSE 8080

# 设置容器启动时运行的命令
CMD ["./fuclaude"]
