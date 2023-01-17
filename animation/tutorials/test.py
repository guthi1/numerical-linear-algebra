from manim import *

class Test(Scene):
    def construct(self):
        eq = MathTex(
            # r"\mathtt{J} = \frac{x a}{b}",
            r"e^x = x^0 + x^1 + \frac{1}{2} x^2 + \frac{1}{6} x^3 + \cdots + \frac{1}{n!} x^n + \cdots",
            substrings_to_isolate="x"    
        )

        self.play(FadeIn(eq))
        self.wait(1)
        eq.set_color_by_tex("x", YELLOW)
        self.wait(3)
        self.play(FadeOut(eq))

        circle = Circle().shift(LEFT).set_fill(GREEN_A, opacity=0.5)
        triangle = Triangle().shift(RIGHT).set_fill(YELLOW, opacity=0.5)
        self.play(FadeIn(triangle))
        self.play(FadeIn(circle))


        square = Square().shift(UP).set_fill(RED, opacity=1.0)
        self.play(FadeIn(square))

        # animate the change of color
        self.play(square.animate.set_fill(WHITE))
        self.wait(1)

        # animate the change of position and the rotation at the same time
        self.play(square.animate.shift(UP).rotate(PI / 3))
        self.play(FadeOut(square), run_time=2)
        self.wait(1)