# Quyết Định Kiến Trúc

## 2026-04-30: Không Merge Source Cơ Học

Quyết định: giữ `D:\Sandbox\Nvidia` và `D:\Sandbox\skill-Anti-brain-wiki_note` là hai repo độc lập trong giai đoạn hiện tại.

Lý do:

- NVIDIA là product shell và active agent runtime.
- ABW là canonical governance engine.
- Merge cơ học sẽ làm mờ ranh giới trách nhiệm và tăng rủi ro agent sửa nhầm repo.

## 2026-04-30: Bridge First

Quyết định: tích hợp bằng contract/bridge trước khi tính tới hợp nhất source.

Thứ tự ưu tiên:

1. CLI bridge.
2. FastAPI/local service nếu UI cần trạng thái realtime.
3. Quyết định package/submodule/monorepo sau.

## 2026-04-30: Provider Agnostic

Quyết định: không để kiến trúc dài hạn phụ thuộc vào việc NVIDIA còn miễn phí hay không.

Lý do:

- NVIDIA NIM, Gemini, OpenAI và local model phải là provider có thể thay thế.
- Giá trị bền vững nằm ở runtime, governance, knowledge pipeline và audit trail.

## 2026-04-30: Ranh Giới State

Quyết định:

- `.nvidia-agent` là app/runtime state.
- `.brain` là governed project cognitive/action state.
- `raw/processed/wiki` là ABW knowledge pipeline state.

Không nhập các store này vào nhau nếu chưa có migration plan rõ ràng.

