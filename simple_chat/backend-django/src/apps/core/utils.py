from django.core.mail import EmailMultiAlternatives
from django.template import Context, Template, TemplateDoesNotExist
from django.template.loader import render_to_string


def send_mail_template(to, template_prefix, context=None, attachments=[]):
    subject = render_to_string(f"{template_prefix}_subject.txt", context)
    subject = "".join(subject.splitlines())

    try:
        body = render_to_string(f"{template_prefix}_email.txt", context)
    except TemplateDoesNotExist:
        body = None

    msg = EmailMultiAlternatives(subject, to=[to], body=body or "")

    try:
        msg.attach_alternative(
            render_to_string(f"{template_prefix}_email.html", context), "text/html"
        )
    except TemplateDoesNotExist:
        pass
    for attachment in attachments:
        msg.attach(**attachment)

    msg.send()


def send_mail(
    recipients,
    subject_template=None,
    body_template=None,
    body_template_html=None,
    context=None,
    attachments=[],
):
    context = Context(context)
    subject = Template(subject_template).render(context)
    subject = "".join(subject.splitlines())
    body = Template(body_template).render(context) if body_template else None

    msg = EmailMultiAlternatives(subject, to=recipients, body=body or "")
    if body_template_html:
        msg.attach_alternative(
            Template(body_template_html).render(context), "text/html"
        )
    for attachment in attachments:
        msg.attach(**attachment)
    msg.send()
