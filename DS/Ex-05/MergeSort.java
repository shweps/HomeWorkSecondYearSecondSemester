/**
 * @author Aviad Hahami && Hila Ben Hamo
 *
 */
public class MergeSort implements Sort {
	/*
	 * Normal merge sort implementation
	 */

	private int[] m_NumbersArray;
	private int[] m_HelperArray;

	private int m_ArraySize;

	public int[] sort(int[] input) {
		this.m_NumbersArray = input;
		this.m_ArraySize = input.length;
		this.m_HelperArray = new int[m_ArraySize];
		mergeSort(0, --m_ArraySize);

		return this.m_NumbersArray;
	}

	private void mergeSort(int i_Low, int i_High) {

		// check if item @ low position is smaller then the item @ high
		// position, if not then the array is sorted
		if (i_Low < i_High) {

			// get index in the middle of those two buddies
			int i_ArrayMiddle = i_Low + (i_High - i_Low) / 2;

			// map the left side of the array to mergeSort recursively
			mergeSort(i_Low, i_ArrayMiddle);

			// map the right side of the array to mergeSort recursively
			mergeSort(i_ArrayMiddle + 1, i_High);

			// reduce results
			merge(i_Low, i_ArrayMiddle, i_High);
		}
	}

	private void merge(int i_Low, int i_Middle, int i_High) {

		// Copy both parts to the helper array and start the reduce.
		for (int i = i_Low; i <= i_High; i++) {
			m_HelperArray[i] = m_NumbersArray[i];
		}

		int i_LeftSidePointer = i_Low;
		int i_RightSidePointer = i_Middle + 1;
		int i_LeftSideMarchingPointer = i_Low;

		// Handpick the smaller value between the two parts of the helper array
		// and inject it to output array
		while (i_LeftSidePointer <= i_Middle && i_RightSidePointer <= i_High) {
			if (m_HelperArray[i_LeftSidePointer] <= m_HelperArray[i_RightSidePointer]) {
				m_NumbersArray[i_LeftSideMarchingPointer] = m_HelperArray[i_LeftSidePointer];
				i_LeftSidePointer++;
			} else {
				m_NumbersArray[i_LeftSideMarchingPointer] = m_HelperArray[i_RightSidePointer];
				i_RightSidePointer++;
			}
			i_LeftSideMarchingPointer++;
		}

		// we might have some leftovers from the LHS of the helper. copy them in
		while (i_LeftSidePointer <= i_Middle) {
			m_NumbersArray[i_LeftSideMarchingPointer] = m_HelperArray[i_LeftSidePointer];
			i_LeftSideMarchingPointer++;
			i_LeftSidePointer++;
		}

	}
}
