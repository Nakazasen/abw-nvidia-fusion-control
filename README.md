# Điều Phối Hợp Nhất ABW x NVIDIA

Thư mục này là **bộ nhớ điều phối chung** cho hai project local đang phát triển song song:

- `D:\Sandbox\Nvidia`: product shell và active agent runtime.
- `D:\Sandbox\skill-Anti-brain-wiki_note`: ABW governance engine / constitutional layer.

Chiến lược hiện tại: **hợp nhất tư tưởng và contract trước, không merge source cơ học**.

## Định Vị Cốt Lõi

```text
Model Providers: NVIDIA NIM / Gemini / OpenAI / local model
        |
NVIDIA Agent Runtime: UI, CLI, MCP, IDE, terminal, tools, self-code loop
        |
ABW Constitutional Layer: governance, grounded memory, continuation gate, audit
        |
Enterprise Reality Layer: SOP, QA, manuals, ERP/MES/QMS, production logs
```

## Vai Trò Hai Repo

| Repo | Đường dẫn local | GitHub | Vai trò |
|---|---|---|---|
| NVIDIA | `D:\Sandbox\Nvidia` | `https://github.com/Nakazasen/nvidia-server` | Product shell, active agent runtime, IDE, UI, tools |
| ABW | `D:\Sandbox\skill-Anti-brain-wiki_note` | `https://github.com/Nakazasen/skill-Anti-brain-wiki_note` | Governance engine, grounded memory, action constitution |

## Luật Làm Việc

Mỗi prompt gửi cho Agent phải ghi rõ:

- workspace duy nhất được phép đọc/ghi,
- workspace bị cấm sửa,
- output bắt buộc,
- phạm vi không được vượt qua.

Dùng thư mục này để quản lý:

- nhật ký tích hợp,
- roadmap,
- quyết định kiến trúc,
- rủi ro,
- handoff,
- prompt cho Architect/Builder/Auditor,
- báo cáo liên quan đến cả hai repo.

Không lưu secret, tài liệu doanh nghiệp riêng tư, dữ liệu khách hàng, hoặc `.brain` chưa sanitize vào thư mục này.

