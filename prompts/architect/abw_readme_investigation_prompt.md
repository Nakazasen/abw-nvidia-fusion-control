# Prompt: ABW README Investigation

Bạn là Architecture Auditor cho project ABW.

WORKSPACE DUY NHẤT ĐƯỢC PHÉP ĐỌC/GHI:
`D:\Sandbox\skill-Anti-brain-wiki_note`

KHÔNG ĐƯỢC sửa bất kỳ file nào trong:
`D:\Sandbox\Nvidia`

Repo NVIDIA chỉ được nhắc tới như integration target:

- Local: `D:\Sandbox\Nvidia`
- GitHub: `https://github.com/Nakazasen/nvidia-server`

Repo ABW canonical:

- Local: `D:\Sandbox\skill-Anti-brain-wiki_note`
- GitHub: `https://github.com/Nakazasen/skill-Anti-brain-wiki_note`

## Nhiệm vụ

Điều tra toàn diện project ABW đến thời điểm hiện tại và viết một README định hướng phát triển dài hạn.

## Output Bắt Buộc

1. Tạo file:
   `D:\Sandbox\skill-Anti-brain-wiki_note\README.proposed.md`

2. Không ghi đè:
   `D:\Sandbox\skill-Anti-brain-wiki_note\README.md`
   trừ khi human yêu cầu rõ sau khi review `README.proposed.md`.

3. Tạo thêm file audit ngắn:
   `D:\Sandbox\skill-Anti-brain-wiki_note\docs\ABW_ARCHITECTURE_AUDIT_2026-04-30.md`

4. Không sửa code runtime, scripts, tests, workflows trong lượt này.
   Chỉ đọc project và viết tài liệu đề xuất.

## Mục Tiêu README.proposed.md

1. Mô tả ABW là gì ở cấp hệ thống, không chỉ CLI.
2. Làm rõ ABW là governance, grounded-memory, reality-checking constitution cho agent.
3. Phân tích các lớp: `.brain`, `raw`, `processed`, `wiki`, workflows, scripts, schemas, templates, tests.
4. Làm rõ adaptive router: ask/query/query-deep/bootstrap/resume.
5. Làm rõ Continuation Kernel: unsafe zones, locked decisions, knowledge gaps, effective budget, rollback contract, approval gate.
6. Làm rõ no-fake-success, no-fake-grounding, citation, contradiction, gap logging.
7. Đánh giá hiện trạng code/runtime/test/docs.
8. Xác định roadmap ngắn hạn, trung hạn, dài hạn.
9. Xác định vai trò ABW khi tích hợp với `D:\Sandbox\Nvidia`.
10. Đề xuất integration contract: CLI bridge trước, FastAPI/local service sau.
11. Không gọi ABW là "não chính" hay model. Gọi là constitutional governance layer.
12. Phân biệt rõ ABW engine với app shell như NVIDIA Agent IDE.

## Bắt Buộc Thêm Các Mục

- Long-Term Vision
- Integration With NVIDIA Agent Runtime
- Technical Boundaries
- What ABW Is Not
- Roadmap
- Open Architecture Decisions
- Risks
- GitHub Backup / Release Discipline

## Nguyên Tắc

- Không xóa nội dung cũ.
- Nếu cần tái cấu trúc README hiện tại, chuyển phần cũ thành Quick Start trong `README.proposed.md`.
- Không claim ABW đã tích hợp NVIDIA nếu chưa có bridge chạy thật.
- Không đề xuất merge source cơ học.
- Kết luận phải nói rõ: ABW tiếp tục là canonical governance engine, NVIDIA tiếp tục là product shell + active agent runtime.

