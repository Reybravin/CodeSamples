//Auto resizing UITextView
//UITextViewDelegate Method

func textViewDidChange(_ textView: UITextView) {
      let fixedWidth = textView.frame.size.width
      textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
      let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
      var newFrame = textView.frame
      newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
      textView.frame = newFrame
}
