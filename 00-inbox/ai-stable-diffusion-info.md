# Stable Diffusion Info for Local Install

- [Run Stable Diffusion](#Run%20Stable%20Diffusion)
- [Install in local venv](#Install%20in%20local%20venv)
- [Installation Exceptions](#Installation%20Exceptions)
- [**Verify it’s only in the venv**](#**Verify%20it%E2%80%99s%20only%20in%20the%20venv**)
- [Uninstalling AUTOMATIC1111 Stable Diffusion WebUI (macOS)](#Uninstalling%20AUTOMATIC1111%20Stable%20Diffusion%20WebUI%20(macOS))
	- [1. Stop the WebUI](#1.%20Stop%20the%20WebUI)
	- [2. Remove the main folder](#2.%20Remove%20the%20main%20folder)
	- [3. (Optional) Remove Hugging Face cache](#3.%20(Optional)%20Remove%20Hugging%20Face%20cache)
	- [4. (Optional) Targeted Hugging Face cleanup](#4.%20(Optional)%20Targeted%20Hugging%20Face%20cleanup)
	- [5. (Optional) Remove other caches](#5.%20(Optional)%20Remove%20other%20caches)
- [Configure for Human Realism](#Configure%20for%20Human%20Realism)
	- [**1. Use a human/photoreal-tuned model**](#**1.%20Use%20a%20human/photoreal-tuned%20model**)
	- [**2. Add an anatomy/pose Lora**](#**2.%20Add%20an%20anatomy/pose%20Lora**)
	- [**3. Adjust generation settings**](#**3.%20Adjust%20generation%20settings**)
	- [**4. Use a realism prompt structure**](#**4.%20Use%20a%20realism%20prompt%20structure**)
	- [**5. Optional anatomy repair tools**](#**5.%20Optional%20anatomy%20repair%20tools**)

## Run Stable Diffusion 
*assumes it is fully installed and functional*

From Terminal:
```bash
cd /path/to/stable-diffusion-webui
./webui.sh
```
- That will activate the venv, start the server, and launch the WebUI.
- When it’s ready, you’ll see:
    ```
    Running on local URL:  http://127.0.0.1:7860
    ```
- Open that URL in your browser.

**Optional flags**
- `./webui.sh --outdir ~/Downloads/sd-outputs` -- will set downloads location
- `./webui.sh --listen` → makes it reachable from other devices on your network.
- `./webui.sh --medvram` or `--lowvram` → lower GPU memory use if needed.

---

## Install in local venv

navigate to target parent directory in terminal

```bash
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
cd stable-diffusion-webui
./webui.sh
```

It will:
- Create a Python **virtual environment** in `./venv` inside the `stable-diffusion-webui` folder.
- Install all dependencies (PyTorch with MPS for Apple Silicon, required Python libs) **only** in that venv.
- Leave your macOS system Python and global packages untouched.
- Keep everything self-contained so you can delete the whole folder to remove it.

_Tagline: Keep it in the venv—delete once, forget forever._

Access WebUI
```
http://localhost:7860
```

---
## Installation Exceptions 

if it hangs on downloading a model and won't progress, run the following then it will resume where it left off

Ctrl+C
```bash
./webui.sh
```


---

## **Verify it’s only in the venv**  
Run these to confirm:
```bash
# 1. Show active Python for webui.sh (should point inside ./venv)
cd /path/to/stable-diffusion-webui
./venv/bin/python -c "import sys; print(sys.executable)"

# 2. List installed packages for this venv (isolated from system Python)
./venv/bin/pip list

# 3. Compare to system Python (should not have A1111 packages)
python3 -m pip list
```

If the `sys.executable` path is inside `stable-diffusion-webui/venv/`, then everything Python-related is contained in that folder.

---

## Uninstalling AUTOMATIC1111 Stable Diffusion WebUI (macOS)

### 1. Stop the WebUI
If running:
```bash
Ctrl+C
````

### 2. Remove the main folder
Replace `/path/to` with your actual location:
```bash
rm -rf /path/to/stable-diffusion-webui
```

### 3. (Optional) Remove Hugging Face cache
This cache stores model weights to avoid re-downloading:
```bash
rm -rf ~/.cache/huggingface
```

### 4. (Optional) Targeted Hugging Face cleanup
Removes only Stable Diffusion–related models, leaves other cached models untouched:
```bash
find ~/.cache/huggingface/hub -type d -name "*stable-diffusion*" -exec rm -rf {} +
```

### 5. (Optional) Remove other caches
If you downloaded models manually or used extensions, check and delete:
```bash
rm -rf ~/Downloads/sd-outputs
rm -rf ~/Library/Application\ Support/stable-diffusion
```

**Done:** All Python dependencies, scripts, and models are gone.


---

## Configure for Human Realism

Your base model (**v1-5-pruned-emaonly**) is a general-purpose SD 1.5 checkpoint — it’s not trained for photorealism or anatomical accuracy, so missing arms, warped limbs, and twisted poses are common.

Here’s how to drastically improve human realism:

### **1. Use a human/photoreal-tuned model**
  
Replace v1-5-pruned-emaonly with one of these:
- **Realistic Vision v6.0** (SD 1.5-based, very good anatomy)
- **Deliberate v2.0** (balanced realism and flexibility) 
- **RevAnimated** (if you want semi-real + stylized flexibility)

**Install:**
1. Download .safetensors from [CivitAI](https://civitai.com/).
2. Put it in:
```
stable-diffusion-webui/models/Stable-diffusion/
```    
3. Select it in the WebUI.

---

### **2. Add an anatomy/pose Lora**

- **epiCRealism Lora** or **PhotoPose Lora** can improve limb placement.    
- Put .safetensors in:
```
stable-diffusion-webui/models/Lora/
```
- Call in prompt:
```
<lora:epiCRealism:0.8>
```


---

### **3. Adjust generation settings**

- **Base image**:    
    - Steps: 20–25 (more isn’t always better; high steps can introduce distortion)
    - CFG Scale: 5.5–7 (lower CFG can reduce overbaked weirdness)
    - Size: Use aspect ratios close to real photos (e.g., 768×1152 for portraits)

- **Hires.fix**:    
    - Upscale: 2 (instead of 3; large jumps amplify distortions)
    - Denoising: 0.3–0.4 (lets SD “redraw” details while keeping pose intact)
    - Upscaler: Latent (nearest) or Latent (bicubic) for sharpness, or 4x-UltraSharp for cleaner lines.

---

### **4. Use a realism prompt structure**

Example:
```
(ultra realistic:1.3), photo of a woman, 35mm lens, f1.8, shallow depth of field, skin pores, natural lighting, photorealistic, RAW photo, masterpiece, high detail
```

Negative prompt:
```
cartoon, anime, 3d render, cgi, blurry, lowres, bad hands, bad arms, extra limbs, disfigured, malformed, mutated, deformed
```

---

### **5. Optional anatomy repair tools**

- Install **ADetailer** extension — it detects faces/hands and fixes them automatically in a second pass.    
- Install from **Extensions → Available → ADetailer** in A1111.

---

## Civit AI Model Info

[iLustMix](https://civitai.com/models/1110783/ilustmix)
![200](-assets/ai-stable-diffusion-info-2025-08-13.png)

[Real Dream](https://civitai.com/models/153568/real-dream)
![250](-assets/ai-stable-diffusion-info-2025-08-13%201.png)

[Prefect illustrious XL](https://civitai.com/models/1224788/prefect-illustrious-xl)
![250](-assets/ai-stable-diffusion-info-2025-08-13%202.png)



### Babes Illustrious By Stable Yogi

[link](https://civitai.com/models/1134825/babes-illustrious-by-stable-yogi)
![250](-assets/ai-stable-diffusion-info-2025-08-13%203.png)

**Recommended Samplers**
- DPM++ SDE
- DPM++ 2M
- DPM++ 2M SDE

**Optimal Settings**
- **Steps:** 27
- **CFG Scale:** 4–5
- **Clip Skip:** 2
- **Resolution:** Any SDXL size; for Insta‑ready posts use **896 × 1120 px**
- **High‑Res Fix:** 1.206× upscale with the **4× ClearRealityV1** upscaler (9 steps, denoise 0.1)


---
### Negative Prompt Content

```text
(worst quality, low quality:1.4), (bad anatomy:1.2), (extra limbs:1.2), extra arms, extra legs, extra fingers, missing fingers, fused fingers, long fingers, mutated hands, poorly drawn hands, deformed hands, bad hands, bad hand anatomy, missing limbs, bad face, deformed face, cross-eye, squinting, asymmetrical eyes, wonky eyes, bad eyes, blurry eyes, extra eyes, unnatural eyes, disconnected limbs, disfigured, tiling, artifacts, jpeg artifacts, text, watermark, signature, logo, blurry, lowres, cropped, out of frame, worst face, fused face, cloned face, poorly drawn face, deformed iris, bad pupils, grainy, bad proportions, cloned person, malformed body, bad body, uncoordinated body, unnatural body, unrealistic body, mutated body, mutation, bad shadow, bad lighting, bad shading, doll-like, waxy skin, plastic skin, untextured skin
```