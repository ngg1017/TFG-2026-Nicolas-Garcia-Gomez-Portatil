import reflex as rx
import os

config = rx.Config(
    app_name="TFG_2026_Nicolas_Garcia_Gomez",
    plugins=[
        rx.plugins.SitemapPlugin(),
        rx.plugins.TailwindV4Plugin(),
    ]
)