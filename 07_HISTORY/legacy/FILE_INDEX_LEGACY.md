# ChềEMục File Điều Phối

File này quản lý toàn bềEfile markdown cần thiết cho quá trình kết hợp ABW x NVIDIA.

## File Chính Trong Control Folder

| File | Vai trò | Khi nào cập nhật |
|---|---|---|
| `README.md` | Tổng quan control folder và định vềEhai repo | Khi đổi định vềEtổng thềE|
| `03_OPERATIONS/SESSION_RESTORE.md` | Prompt khởi đầu phiên mới và thứ tự đọc đềEphục hồi bối cảnh | Khi thêm/bớt file quan trọng |
| `03_OPERATIONS/SESSION_CLOSE.md` | Prompt kết thúc phiên và checklist lưu phiên | Khi đổi quy trình lưu phiên |
| `03_OPERATIONS/HANDOFF.md` | Trạng thái hiện tại, việc dang dềE việc nên làm tiếp | Cuối mỗi phiên |
| `07_HISTORY/INTEGRATION_JOURNAL.md` | Lịch sử phát triển chung | Mỗi khi có bước quan trọng |
| `05_DECISIONS/ROADMAP.md` | Việc ngắn hạn/trung hạn/dài hạn | Khi đổi ưu tiên |
| `05_DECISIONS/DECISIONS.md` | Quyết định kiến trúc đã chốt | Khi có quyết định mới |
| `05_DECISIONS/RISKS.md` | Rủi ro và cách phòng | Khi phát hiện rủi ro mới |
| `03_OPERATIONS/NEXT.md` | Prompt đềEAgent gợi ý việc tiếp theo | Khi đổi cách điều phối |
| `02_ARCHITECTURE/BRIDGE_CONTRACT.md` | Contract tích hợp ABW x NVIDIA | Khi thiết kế/đổi bridge |
| `repo-map.json` | Bản đềEđường dẫn repo và vai trò | Khi đổi đường dẫn/repo |
| `AGENTS.md` | Hướng dẫn cho AI agent làm việc trong repo này | Khi đổi quy trình agent hoặc conventions |

## Prompt Agent

| File | Vai trò |
|---|---|
| `prompts\architect\abw_readme_investigation_prompt.md` | Prompt đã dùng đềEđiều tra ABW và tạo README đềExuất |

## File Liên Quan Trong Repo NVIDIA

| File | Vai trò |
|---|---|
| `D:\Sandbox\Nvidia\README.md` | Roadmap và triết lý NVIDIA Agent Runtime |
| `D:\Sandbox\Nvidia\.nvidia-agent\reports\audit-nvidia-abw-fusion-2026-04-30.md` | Audit fusion ban đầu |

## File Liên Quan Trong Repo ABW

| File | Vai trò |
|---|---|
| `D:\Sandbox\skill-Anti-brain-wiki_note\README.proposed.md` | README ABW đềExuất sau audit |
| `D:\Sandbox\skill-Anti-brain-wiki_note\docs\ABW_ARCHITECTURE_AUDIT_2026-04-30.md` | Audit kiến trúc ABW |

## File Quản Lý Lịch Sử

Lịch sử phát triển chung được quản lý trong:

```text
D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\07_HISTORY/INTEGRATION_JOURNAL.md
```

Trạng thái bàn giao mới nhất được quản lý trong:

```text
D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\03_OPERATIONS/HANDOFF.md
```
