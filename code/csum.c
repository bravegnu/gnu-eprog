static int arr[] = { 1, 10, 4, 5, 6, 7 };
static int sum;
static const int n = sizeof(arr) / sizeof(arr[0]);

int main()
{
	int i;

	for (i = 0; i < n; i++)
		sum += arr[i];
}
