"""生成复习书中的插图：python3 plots.py（在 assets 目录下运行）"""

import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib import font_manager

for path in [
    "/home/yee/.local/share/fonts/LXGWWenKaiMonoScreen.ttf",
]:
    try:
        font_manager.fontManager.addfont(path)
    except FileNotFoundError:
        pass
plt.rcParams.update(
    {
        "font.family": ["LXGW WenKai Mono Screen", "DejaVu Sans"],
        "mathtext.fontset": "cm",
        "axes.unicode_minus": False,
        "font.size": 11,
        "svg.fonttype": "path",
    }
)


def save(fig, name):
    fig.tight_layout()
    fig.savefig(name + ".svg")
    plt.close(fig)


def axis_cross(ax):
    ax.axhline(0, color="k", lw=0.8)
    ax.axvline(0, color="k", lw=0.8)


# ---------- 第3章：二阶系统 ----------
def second_order_step(zeta, wn, t):
    if zeta < 1:
        wd = wn * np.sqrt(1 - zeta**2)
        beta = np.arccos(zeta)
        return 1 - np.exp(-zeta * wn * t) / np.sqrt(1 - zeta**2) * np.sin(wd * t + beta)
    if zeta == 1:
        return 1 - (1 + wn * t) * np.exp(-wn * t)
    s1 = -zeta * wn + wn * np.sqrt(zeta**2 - 1)
    s2 = -zeta * wn - wn * np.sqrt(zeta**2 - 1)
    return 1 + (s2 * np.exp(s1 * t) - s1 * np.exp(s2 * t)) / (s1 - s2)


def fig_step_indices():
    zeta, wn = 0.4, 1.0
    t = np.linspace(0, 14, 1500)
    y = second_order_step(zeta, wn, t)
    wd = wn * np.sqrt(1 - zeta**2)
    tr = (np.pi - np.arccos(zeta)) / wd
    tp = np.pi / wd
    mp = np.exp(-zeta * np.pi / np.sqrt(1 - zeta**2))
    ts = 3 / (zeta * wn)
    fig, ax = plt.subplots(figsize=(7, 3.6))
    ax.plot(t, y, "k", lw=1.6)
    ax.axhline(1, color="gray", ls="--", lw=0.8)
    ax.axhspan(0.95, 1.05, color="tab:blue", alpha=0.08)
    ax.axhline(1.05, color="tab:blue", ls=":", lw=0.8)
    ax.axhline(0.95, color="tab:blue", ls=":", lw=0.8)
    ax.plot([tr, tr], [0, 1], "tab:green", ls="--", lw=0.9)
    ax.plot([tp, tp], [0, 1 + mp], "tab:red", ls="--", lw=0.9)
    ax.plot([ts, ts], [0, 1.05], "tab:blue", ls="--", lw=0.9)
    ax.annotate("", xy=(tp + 0.4, 1 + mp), xytext=(tp + 0.4, 1), arrowprops=dict(arrowstyle="<->", color="tab:red"))
    ax.text(tp + 0.6, 1 + mp / 2, r"$M_p$", color="tab:red", va="center")
    ax.text(tr, -0.1, r"$t_r$", ha="center", color="tab:green")
    ax.text(tp, -0.1, r"$t_p$", ha="center", color="tab:red")
    ax.text(ts, -0.1, r"$t_s$", ha="center", color="tab:blue")
    ax.text(13.8, 1.07, r"$\pm5\%$", ha="right", color="tab:blue", fontsize=9)
    ax.set_xlim(0, 14)
    ax.set_ylim(-0.15, 1.45)
    ax.set_xticks([])
    ax.set_xlabel(r"$t$")
    ax.set_ylabel(r"$x_o(t)$")
    ax.spines[["top", "right"]].set_visible(False)
    save(fig, "step_indices")


def fig_step_zeta():
    t = np.linspace(0, 15, 1500)
    fig, ax = plt.subplots(figsize=(7, 3.6))
    for z in [0, 0.2, 0.5, 0.707, 1, 2]:
        ax.plot(t, second_order_step(z, 1.0, t), lw=1.3, label=rf"$\zeta={z}$")
    ax.axhline(1, color="gray", ls="--", lw=0.8)
    ax.set_xlabel(r"$\omega_n t$")
    ax.set_ylabel(r"$x_o(t)$")
    ax.legend(ncol=3, fontsize=9, frameon=False)
    ax.spines[["top", "right"]].set_visible(False)
    save(fig, "step_zeta")


# ---------- Bode 渐近线 ----------
def asymptote(w, K, v, corners):
    """corners: [(转折频率, 阶数)]，阶数 +1 为一阶微分，-1 为惯性，-2 为二阶振荡"""
    L = 20 * np.log10(K) - 20 * v * np.log10(w)
    for wc, order in corners:
        L = L + np.where(w > wc, 20 * order * np.log10(w / wc), 0)
    return L


def bode_axes(ax, wmin, wmax):
    ax.set_xscale("log")
    ax.set_xlim(wmin, wmax)
    ax.axhline(0, color="k", lw=0.8)
    ax.grid(True, which="both", lw=0.3, alpha=0.5)
    ax.set_xlabel(r"$\omega$ (rad/s)")
    ax.set_ylabel(r"$L(\omega)$ (dB)")


def fig_lead_lag():
    w = np.logspace(-2, 2, 800)
    fig, axs = plt.subplots(2, 2, figsize=(8, 4.6), sharex="col")
    # 超前：(Ts+1)/(aTs+1), a=0.1, T=1
    a, T = 0.1, 1.0
    G = (1j * w * T + 1) / (1j * w * a * T + 1)
    wm = 1 / (T * np.sqrt(a))
    axs[0, 0].semilogx(w, 20 * np.log10(abs(G)), "k")
    axs[0, 0].semilogx(w, asymptote(w, 1, 0, [(1 / T, 1), (1 / (a * T), -1)]), "tab:blue", ls="--", lw=0.9)
    axs[0, 0].set_title(r"超前网络 $\dfrac{Ts+1}{\alpha Ts+1}\ (\alpha<1)$", fontsize=11)
    axs[0, 0].axvline(wm, color="tab:red", ls=":", lw=0.9)
    axs[0, 0].text(wm * 1.1, 2, r"$\omega_m$", color="tab:red")
    axs[0, 0].text(1.2e-2, 15, r"$-20\lg\alpha$", fontsize=9)
    axs[1, 0].semilogx(w, np.degrees(np.angle(G)), "k")
    axs[1, 0].axvline(wm, color="tab:red", ls=":", lw=0.9)
    axs[1, 0].text(wm * 1.1, 10, r"$\varphi_m$", color="tab:red")
    # 滞后：(Ts+1)/(bTs+1), b=10, T=1
    b = 10
    G = (1j * w * T + 1) / (1j * w * b * T + 1)
    wm = 1 / (T * np.sqrt(b))
    axs[0, 1].semilogx(w, 20 * np.log10(abs(G)), "k")
    axs[0, 1].semilogx(w, asymptote(w, 1, 0, [(1 / (b * T), -1), (1 / T, 1)]), "tab:blue", ls="--", lw=0.9)
    axs[0, 1].set_title(r"滞后网络 $\dfrac{Ts+1}{\beta Ts+1}\ (\beta>1)$", fontsize=11)
    axs[0, 1].text(15, -17, r"$-20\lg\beta$", fontsize=9)
    axs[1, 1].semilogx(w, np.degrees(np.angle(G)), "k")
    axs[1, 1].axvline(wm, color="tab:red", ls=":", lw=0.9)
    for ax in axs.flat:
        ax.grid(True, which="both", lw=0.3, alpha=0.5)
    axs[0, 0].set_ylabel(r"$L$ (dB)")
    axs[1, 0].set_ylabel(r"$\varphi$ (°)")
    for ax in axs[1]:
        ax.set_xlabel(r"$\omega T$")
    save(fig, "lead_lag")


def fig_hopt():
    w = np.logspace(-1, 2.3, 400)
    w2, wc, w3 = 1.0, 3.0, 10.0
    K = wc * w2
    L = asymptote(w, K, 2, [(w2, 1), (w3, -1)])
    fig, ax = plt.subplots(figsize=(6.5, 3.2))
    ax.semilogx(w, L, "k", lw=1.6)
    bode_axes(ax, w[0], w[-1])
    for x, lab in [(w2, r"$\omega_2=1/T_2$"), (wc, r"$\omega_c$"), (w3, r"$\omega_3=1/T_3$")]:
        ax.axvline(x, color="gray", ls=":", lw=0.9)
        ax.text(x * 1.05, -45, lab, fontsize=10)
    ax.text(0.15, 45, "[-40]")
    ax.text(1.5, 10, "[-20]")
    ax.text(20, -25, "[-40]")
    ax.annotate("", xy=(w3, 30), xytext=(w2, 30), arrowprops=dict(arrowstyle="<->", color="tab:red"))
    ax.text(np.sqrt(w2 * w3), 33, r"中频宽 $h=\omega_3/\omega_2$", ha="center", color="tab:red")
    ax.set_ylim(-55, 60)
    ax.set_xticks([])
    ax.minorticks_off()
    save(fig, "hopt")


def fig_bode_pair(name, w, curves, labels, ylim, marks=()):
    fig, ax = plt.subplots(figsize=(7, 3.4))
    styles = [("k", "-"), ("tab:blue", "--"), ("tab:red", "-")]
    for (K, v, corners), lab, (color, ls) in zip(curves, labels, styles):
        ax.semilogx(w, asymptote(w, K, v, corners), color=color, ls=ls, lw=1.5, label=lab)
    for x, lab in marks:
        ax.axvline(x, color="gray", ls=":", lw=0.8)
        ax.text(x * 1.05, ylim[0] + 3, lab, fontsize=9)
    bode_axes(ax, w[0], w[-1])
    ax.set_ylim(*ylim)
    ax.legend(frameon=False, fontsize=10)
    save(fig, name)


# ---------- Nyquist ----------
def fig_nyquist_2526():
    K = 3.0
    w = np.logspace(-0.7, 2, 2000)
    s = 1j * w
    G = K / (s * (s + 1) * (s + 2))
    fig, ax = plt.subplots(figsize=(5.5, 4.2))
    ax.plot(G.real, G.imag, "k", lw=1.5)
    ax.plot(G.real, -G.imag, "gray", ls="-.", lw=0.8)
    R = 3.2
    th = np.linspace(0, -np.pi / 2, 100)
    ax.plot(R * np.cos(th) + 0, R * np.sin(th), "tab:blue", ls="--", lw=1)
    ax.annotate("", xy=(0.05, -R), xytext=(0.6, -R * 0.95), arrowprops=dict(arrowstyle="->", color="tab:blue"))
    ax.text(2.0, -2.0, r"$\omega:0\to0^+$" "\n" r"($R\to\infty$)", color="tab:blue", fontsize=9)
    ax.plot([-1], [0], "r+", ms=10, mew=2)
    ax.text(-1, 0.15, "(-1, j0)", color="r", ha="center", fontsize=9)
    ax.plot([-K / 6], [0], "ko", ms=4)
    ax.text(-K / 6, -0.3, r"$-K/6$", ha="center", fontsize=9)
    ax.axvline(-0.75 * K, color="gray", ls=":", lw=0.8)
    ax.text(-0.75 * K + 0.05, -3.0, r"$-\frac{3K}{4}$", fontsize=10)
    i = np.argmin(abs(w - 0.9))
    ax.annotate("", xy=(G.real[i + 5], G.imag[i + 5]), xytext=(G.real[i], G.imag[i]), arrowprops=dict(arrowstyle="->"))
    axis_cross(ax)
    ax.set_xlim(-3, 3.5)
    ax.set_ylim(-3.5, 1.5)
    ax.set_aspect("equal")
    ax.set_title(r"$K/[s(s+1)(s+2)]$，图中 $K=3$", fontsize=11)
    save(fig, "nyq_2526")


def fig_nyquist_2324():
    fig, axs = plt.subplots(1, 2, figsize=(8, 3.4))
    w = np.logspace(-2, 2, 2000)
    for ax, B in zip(axs, [0.5, 2.0]):
        A = 1.0
        s = 1j * w
        G = -1 / (s**2 + A * s + B)
        ax.plot(G.real, G.imag, "k", lw=1.5)
        ax.plot(G.real, -G.imag, "gray", ls="-.", lw=0.8)
        ax.plot([-1], [0], "r+", ms=10, mew=2)
        ax.plot([-1 / B], [0], "ko", ms=4)
        ax.text(-1 / B, -0.2, r"$-1/B$", ha="center", fontsize=9)
        i = np.argmin(abs(w - np.sqrt(B) * 0.6))
        ax.annotate("", xy=(G.real[i + 5], G.imag[i + 5]), xytext=(G.real[i], G.imag[i]), arrowprops=dict(arrowstyle="->"))
        axis_cross(ax)
        ax.set_aspect("equal")
        ax.set_title(rf"$A=1,\ B={B}$" + ("（不稳定）" if B < 1 else "（稳定）"), fontsize=11)
    axs[0].set_xlim(-2.4, 1)
    axs[0].set_ylim(-1.6, 1.6)
    axs[1].set_xlim(-1.3, 0.8)
    axs[1].set_ylim(-0.9, 0.9)
    save(fig, "nyq_2324")


def fig_nyquist_2223():
    K = 3.0
    w = np.logspace(-0.8, 2, 2000)
    s = 1j * w
    G = K * (s + 2) / (s * (s - 2))
    fig, ax = plt.subplots(figsize=(5.5, 4.2))
    ax.plot(G.real, G.imag, "k", lw=1.5)
    ax.plot(G.real, -G.imag, "gray", ls="-.", lw=0.8)
    R = 4.5
    th = np.linspace(np.pi, np.pi / 2, 100)
    ax.plot(R * np.cos(th), R * np.sin(th), "tab:blue", ls="--", lw=1)
    ax.text(-4.4, 3.6, r"$\omega:0\to0^+$" "\n" r"($R\to\infty$)", color="tab:blue", fontsize=9)
    ax.plot([-1], [0], "r+", ms=10, mew=2)
    ax.plot([-K / 2], [0], "ko", ms=4)
    ax.text(-K / 2, -0.45, r"$-K/2\ (\omega=2)$", ha="center", fontsize=9)
    i = np.argmin(abs(w - 1.2))
    ax.annotate("", xy=(G.real[i + 5], G.imag[i + 5]), xytext=(G.real[i], G.imag[i]), arrowprops=dict(arrowstyle="->"))
    axis_cross(ax)
    ax.set_xlim(-5, 1.5)
    ax.set_ylim(-3, 5)
    ax.set_aspect("equal")
    ax.set_title(r"$K(s+2)/[s(s-2)]$，图中 $K=3$", fontsize=11)
    save(fig, "nyq_2223")


# ---------- 根轨迹 ----------
def root_locus(num, den, kmax=1e4, n=4000):
    ks = np.concatenate([[0], np.logspace(-4, np.log10(kmax), n)])
    num = np.array(num, float)
    den = np.array(den, float)
    branches = []
    prev = None
    for k in ks:
        p = np.polyadd(den, k * num)
        r = np.roots(p)
        if prev is None:
            r = np.sort_complex(r)
        else:
            order = []
            left = list(r)
            for q in prev:
                j = int(np.argmin([abs(q - x) for x in left]))
                order.append(left.pop(j))
            r = np.array(order)
        branches.append(r)
        prev = r
    return np.array(branches)


def rl_axes(ax, poles, zeros, xlim, ylim):
    axis_cross(ax)
    ax.plot(np.real(poles), np.imag(poles), "kx", ms=9, mew=2)
    if len(zeros):
        ax.plot(np.real(zeros), np.imag(zeros), "o", mfc="none", mec="k", ms=8, mew=1.5)
    ax.set_xlim(*xlim)
    ax.set_ylim(*ylim)
    ax.set_aspect("equal")
    ax.set_xlabel(r"$\sigma$")
    ax.set_ylabel(r"$j\omega$")


def draw_branches(ax, B, colors=("tab:blue", "tab:red", "tab:green", "tab:orange")):
    for i in range(B.shape[1]):
        ax.plot(B[:, i].real, B[:, i].imag, color=colors[i % len(colors)], lw=1.5)


def fig_rl_2425():
    B = root_locus([1], np.poly([0, -2, -5]), kmax=2000)
    fig, ax = plt.subplots(figsize=(6, 4.6))
    draw_branches(ax, B)
    rl_axes(ax, [0, -2, -5], [], (-9, 2), (-5, 5))
    sa = -7 / 3
    for ang in [60, -60]:
        ax.plot([sa, sa + 8 * np.cos(np.radians(ang))], [0, 8 * np.sin(np.radians(ang))], "gray", ls="--", lw=0.8)
    ax.plot([sa], [0], "k.", ms=6)
    ax.text(sa, -0.5, r"$-\frac{7}{3}$", ha="center")
    ax.plot([0, -5 * 0.5], [0, 5 * 0.866], "tab:purple", ls=":", lw=1)
    ax.text(-2.6, 4.4, r"$\zeta=0.5$", color="tab:purple")
    r = 10 / 7
    ax.plot([-0.5 * r] * 2, [0.866 * r, -0.866 * r], "ks", ms=5)
    ax.text(-0.5 * r + 0.15, 0.866 * r + 0.15, r"$-0.71+j1.24$", fontsize=9)
    ax.plot([0], [np.sqrt(10)], "k.", ms=6)
    ax.text(0.15, np.sqrt(10), r"$j\sqrt{10}$", fontsize=9)
    ax.plot([-0.88], [0], "k.", ms=6)
    ax.text(-0.88, 0.25, r"$-0.88$", ha="center", fontsize=9)
    ax.set_title(r"$K^*/[s(s+2)(s+5)]$", fontsize=11)
    save(fig, "rl_2425")


def fig_rl_2526():
    B = root_locus([1], np.poly([0, -4 + 2j, -4 - 2j]).real, kmax=3000)
    fig, ax = plt.subplots(figsize=(6, 4.6))
    draw_branches(ax, B)
    rl_axes(ax, [0, -4 + 2j, -4 - 2j], [], (-9, 2), (-6, 6))
    sa = -8 / 3
    for ang in [60, -60]:
        ax.plot([sa, sa + 9 * np.cos(np.radians(ang))], [0, 9 * np.sin(np.radians(ang))], "gray", ls="--", lw=0.8)
    for d, lab in [(-2, "-2"), (-10 / 3, r"$-\frac{10}{3}$")]:
        ax.plot([d], [0], "k.", ms=6)
        ax.text(d, -0.7, lab, ha="center", fontsize=9)
    ax.plot([0], [np.sqrt(20)], "k.", ms=6)
    ax.text(0.15, np.sqrt(20), r"$j2\sqrt{5}$", fontsize=9)
    ax.set_title(r"$K^*/[s(s^2+8s+20)]$", fontsize=11)
    save(fig, "rl_2526")


def fig_rl_example():
    B = root_locus([1, 2], np.poly([0, -1, -4]), kmax=2000)
    fig, ax = plt.subplots(figsize=(6, 4.2))
    draw_branches(ax, B)
    rl_axes(ax, [0, -1, -4], [-2], (-6, 1.5), (-4, 4))
    ax.axvline(-1.5, color="gray", ls="--", lw=0.8)
    ax.text(-1.45, 3.5, r"$\sigma_a=-1.5$", fontsize=9)
    ax.set_title(r"$K^*(s+2)/[s(s+1)(s+4)]$", fontsize=11)
    save(fig, "rl_example")


def fig_rl_2223():
    B = root_locus([1], [1, 2, 0], kmax=50)
    fig, ax = plt.subplots(figsize=(5, 3.6))
    draw_branches(ax, B)
    rl_axes(ax, [0, -2], [], (-3, 1), (-3, 3))
    ax.text(-0.95, -0.35, "-1", fontsize=9)
    ax.set_title(r"等效开环 $a/[s(s+2)]$", fontsize=11)
    save(fig, "rl_2223")


if __name__ == "__main__":
    fig_step_indices()
    fig_step_zeta()
    fig_lead_lag()
    fig_hopt()
    w = np.logspace(-1, 3, 600)
    fig_bode_pair(
        "bode_2425t6",
        w,
        [(5, 1, [(2, -1), (10, -1)]), (1, 0, [(2, 1), (20, -1)]), (5, 1, [(10, -1), (20, -1)])],
        ["校正前 $G_0$", "校正环节 $G_c$", "校正后 $G_cG_0$"],
        (-80, 50),
        [(2, "2"), (10, "10"), (20, "20")],
    )
    w = np.logspace(-2, 4, 800)
    fig_bode_pair(
        "bode_2526t6",
        w,
        [
            (500, 1, [(125, -1), (1000, -1)]),
            (1, 0, [(1 / 2.47, -1), (4.5, 1)]),
            (500, 1, [(1 / 2.47, -1), (4.5, 1), (125, -1), (1000, -1)]),
        ],
        ["校正前 $G_0$", "校正环节 $G_c$", "校正后 $G_cG_0$"],
        (-80, 100),
        [(0.405, "0.405"), (4.5, "4.5"), (45, "45"), (125, "125"), (1000, "1000")],
    )
    w = np.logspace(-2, 4, 800)
    fig_bode_pair(
        "bode_2223t6",
        w,
        [
            (200, 1, [(125, -1), (500, -1), (1000, -1)]),
            (1, 0, [(1 / 2.22, -1), (3, 1)]),
            (200, 1, [(1 / 2.22, -1), (3, 1), (125, -1), (500, -1), (1000, -1)]),
        ],
        ["校正前 $G_0$", "校正环节 $G_c$", "校正后 $G_cG_0$"],
        (-100, 100),
        [(0.45, "0.45"), (3, "3"), (30, "30"), (125, "125"), (1000, "1000")],
    )
    w = np.logspace(-1, 2.5, 600)
    fig_bode_pair(
        "bode_2324t3",
        w,
        [(100, 1, [(1, -1), (10, -1), (20, 1)])],
        [r"$100(Ts+1)/[s(s+1)(0.1s+1)]$，图中 $1/T=20$"],
        (-40, 70),
        [(1, "1"), (10, "10"), (20, "1/T")],
    )
    fig_bode_pair(
        "bode_2526t3",
        w,
        [(10, 2, [(1, 1), (10, -1), (20, -1)])],
        [r"$10(s+1)/[s^2(0.1s+1)(Ts+1)]$，图中 $1/T=20$"],
        (-50, 50),
        [(1, "1"), (10, r"10=$\omega_c$"), (20, "1/T")],
    )
    fig_nyquist_2526()
    fig_nyquist_2324()
    fig_nyquist_2223()
    fig_rl_2425()
    fig_rl_2526()
    fig_rl_example()
    fig_rl_2223()
