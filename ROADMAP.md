# Roadmap Hợp Nhất ABW x NVIDIA

## Chiến Lược Hiện Tại

Tiếp tục phát triển hai repo độc lập nhưng theo cùng một tư tưởng kiến trúc.

- NVIDIA tiếp tục là product shell và active agent runtime.
- ABW tiếp tục là canonical governance engine.
- Tích hợp bắt đầu bằng contract và bridge, không merge source.

## Việc Cần Làm Ngay

- Review `D:\Sandbox\skill-Anti-brain-wiki_note\README.proposed.md`.
- Review `D:\Sandbox\skill-Anti-brain-wiki_note\docs\ABW_ARCHITECTURE_AUDIT_2026-04-30.md`.
- Đối chiếu ABW README đề xuất với `D:\Sandbox\Nvidia\README.md` và fusion audit.
- Hoàn thiện `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\BRIDGE_CONTRACT.md`.
- Quyết định có adopt `README.proposed.md` thành README chính của ABW hay không.

## Ngắn Hạn

- NVIDIA tiếp tục Sprint 2+ trong README: context picker, job manager, enterprise/IDE mode, extension UX.
- ABW tiếp tục theo roadmap trong `README.proposed.md` sau khi human duyệt.
- Tạo NVIDIA-side ABW detection/doctor bridge nhỏ.
- Fix mojibake ABW bằng một lượt docs-only có kiểm soát.
- Đồng bộ release truth của ABW: `VERSION`, `pyproject.toml`, release notes, changelog, tags.
- Định nghĩa ranh giới `.nvidia-agent` và `.brain`.
- Định nghĩa trạng thái câu trả lời enterprise: grounded, draft, pending_grounding, disputed, stale, missing.

## Trung Hạn

- Implement CLI bridge:
  - phát hiện ABW workspace,
  - chạy `abw doctor`,
  - chạy `abw ask`,
  - đọc trạng thái `.brain`,
  - hiển thị knowledge gaps.
- Đưa Continuation Kernel vào flow self-improvement của NVIDIA.
- Gắn pending diff với ABW step id.
- Mở rộng `npm run agent:audit` để test hành vi ABW bridge.

## Dài Hạn

- Chỉ cân nhắc FastAPI/local ABW service sau khi CLI bridge chứng minh giá trị.
- Thêm UX ingest tài liệu doanh nghiệp.
- Thêm deployment policy cho môi trường doanh nghiệp/sản xuất.
- Đánh giá tiếp: multi-repo, package dependency, submodule, hay monorepo.

