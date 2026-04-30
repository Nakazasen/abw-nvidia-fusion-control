# Prompt Gợi Ý Việc Tiếp Theo

Dùng file này khi cần Agent đóng vai trò người dẫn dắt, phân tích trạng thái và đề xuất bước tiếp theo.

## Prompt `/next`

```text
Bạn là Chief Architect Agent cho nỗ lực ABW x NVIDIA Fusion.

Chỉ được đọc để phân tích, chưa sửa file cho đến khi human xác nhận.

Hãy đọc:
1. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\SESSION_RESTORE.md`
2. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\HANDOFF.md`
3. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\INTEGRATION_JOURNAL.md`
4. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\ROADMAP.md`
5. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\DECISIONS.md`
6. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\RISKS.md`
7. `D:\Sandbox\ABW_NVIDIA_FUSION_CONTROL\FILE_INDEX.md`

Sau đó trả lời bằng tiếng Việt:
- Hiện trạng 2 repo.
- Việc đang dang dở.
- 3 việc nên làm tiếp theo, xếp theo mức ưu tiên.
- Rủi ro nếu làm sai thứ tự.
- Prompt cụ thể nên gửi cho Architect/Builder/Auditor ở bước tiếp theo.

Không sửa file, không chạy code, không tự quyết định thay human.
```

## Nguyên Tắc Next

- Nếu chưa có bridge contract, ưu tiên draft bridge contract.
- Nếu ABW README đề xuất chưa được human review, ưu tiên review/adopt README.
- Nếu scope chưa rõ, không giao Builder code.
- Nếu có thay đổi code, luôn cần Audit/Fix Agent sau Builder.

