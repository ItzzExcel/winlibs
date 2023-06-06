#include <Windows.h>
#pragma comment (lib, "ntdll.lib")

EXTERN_C NTSTATUS NTAPI RtlAdjustPrivilege(ULONG, BOOLEAN, BOOLEAN, PBOOLEAN);
EXTERN_C NTSTATUS NtRaiseHardError(NTSTATUS, ULONG, ULONG, PULONG_PTR, ULONG, PULONG);

int main()
{
    BOOLEAN Bl = NULL;
    ULONG Response;

    RtlAdjustPrivilege(19, true, false, &Bl);
    NtRaiseHardError(STATUS_ASSERTION_FAILURE, 0, 0, 0, 6, &Response);

    return 0;
}