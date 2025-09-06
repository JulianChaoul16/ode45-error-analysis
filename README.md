# ode45-error-analysis

# ode45-ode-lab: solutions, interpolation, and error analysis

MATLAB/Octave workbook that:
- Solves a nonlinear first-order ODE with `ode45`
- Interpolates solution onto an even grid and compares to the exact solution
- Studies error vs solver tolerance
- Solves a linear second-order ODE via state-space form and plots its phase portrait

## Problems covered

1) **Nonlinear first-order ODE (Riccati/logistic-type)**
   \[
     y' = -y^2 + 2y,\quad y(0)=y_0
   \]
   For \(y_0=1\), the exact solution used is
   \[
     y(t) = \frac{1}{0.5 + 0.5\,e^{-2t}}.
   \]
   We solve with `ode45`, interpolate to an even grid (`interp1`), and plot the absolute error.
   We also repeat with tighter tolerance (`odeset('RelTol',1e-7)`) to show error reduction.

2) **Linear second-order ODE (state-space)**
   System:
   \[
     \begin{cases}
       y_1' = y_2 \\
       y_2' = -2y_2 - 2y_1
     \end{cases}
     \quad\Rightarrow\quad y'' + 2y' + 2y = 0,\quad y(0)=0,\ y'(0)=1.
   \]
   We plot \(y(t)\), \(y'(t)\), and the **phase portrait** \((y, y')\).

> **Note on labels:** The code comments include `2y'' + 2y + 2 = 0` and an `yexact = exp(-2t) - t` line that don’t match this system.  
> The correct scalar ODE is **\(y'' + 2y' + 2y = 0\)** with solution \(y(t)=e^{-t}(C_1\cos t + C_2\sin t)\).  
> Keep the plot titles/comments consistent with this.

## How to run

MATLAB or Octave (no extra toolboxes required).

```matlab
% Option A: paste into a live script and run all
% Option B: save as ode_lab.m and run:
ode_lab
