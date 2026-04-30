# Nhật Ký Tích Hợp

File này là lịch sử phát triển chung của quá trình kết hợp ABW x NVIDIA.

## 2026-04-30 - Tạo Control Folder

Đã tạo thư mục điều phối chung:

```text
D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL
```

Nguyên tắc hiện tại:

- NVIDIA = product shell + active agent runtime.
- ABW = canonical governance engine / constitutional layer.
- Không merge source cơ học.
- Hợp nhất tư tưởng, contract, bridge và tiến độ trước.

## 2026-04-30 - ABW Audit Hoàn Thành

ABW Architecture Auditor đã hoàn thành điều tra docs-only.

Đã tạo trong `D:\Sandbox\skill-Anti-brain-wiki_note`:

- `README.proposed.md`
- `docs\ABW_ARCHITECTURE_AUDIT_2026-04-30.md`

Kết quả chính:

- ABW lớn hơn mô tả trong README hiện tại.
- ABW nên được mô tả là constitutional governance layer, không phải inference provider hay product shell.
- Continuation Kernel v1 là tài sản kiến trúc cốt lõi.
- Local API đủ tiềm năng làm integration boundary sau CLI bridge.
- Một số workflow/skill tiếng Việt có rủi ro mojibake.
- Release truth của ABW đang phân tán giữa release notes và changelog.
- Chưa có NVIDIA integration thật, không được claim đã tích hợp.

Hướng đi đã xác nhận:

- Giữ ABW là canonical governance engine.
- Giữ NVIDIA là product shell và active agent runtime.
- CLI bridge trước.
- FastAPI/local service chỉ sau khi CLI bridge ổn định.
- Không merge source trees.

Việc tiếp theo:

- Review `README.proposed.md`.
- Draft `BRIDGE_CONTRACT.md`.
- Quyết định adopt README ABW sau human review.

