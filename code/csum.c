static int arr[] = { 1, 10, 4, 5, 6, 7 };
static int sum;

int main()
{
	int i;
	int n;

	n = sizeof(arr) / sizeof(arr[0]);
	for (i = 0; i < n; i++)
		sum += arr[i];
}
